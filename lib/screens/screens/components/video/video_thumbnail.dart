import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gender_equality/constants/loading.dart';
import 'package:gender_equality/models/report_model.dart';
import 'package:gender_equality/screens/screens/components/video/video_player.dart';
import 'dart:io';

import 'package:video_thumbnail/video_thumbnail.dart';

import 'package:path_provider/path_provider.dart';

class ThumbnailRequest {
  final String? video;
  final String? thumbnailPath;
  final ImageFormat? imageFormat;
  final int? maxHeight;
  final int? maxWidth;
  final int? timeMs;
  final int? quality;

  const ThumbnailRequest(
      {this.video,
      this.thumbnailPath,
      this.imageFormat,
      this.maxHeight,
      this.maxWidth,
      this.timeMs,
      this.quality});
}

class ThumbnailResult {
  final Image? image;
  final int? dataSize;
  final int? height;
  final int? width;
  const ThumbnailResult({this.image, this.dataSize, this.height, this.width});
}

Future<ThumbnailResult> genThumbnail(ThumbnailRequest r) async {
  //WidgetsFlutterBinding.ensureInitialized();
  Uint8List bytes;
  final Completer<ThumbnailResult> completer = Completer();
  if (r.thumbnailPath != null) {
    final thumbnailPath = await VideoThumbnail.thumbnailFile(
        video: r.video!,
        thumbnailPath: r.thumbnailPath,
        imageFormat: r.imageFormat!,
        maxHeight: r.maxHeight!,
        maxWidth: r.maxWidth!,
        timeMs: r.timeMs!,
        quality: r.quality!);

    final file = File(thumbnailPath!);
    bytes = file.readAsBytesSync();
  } else {
    bytes = (await VideoThumbnail.thumbnailData(
        video: r.video!,
        imageFormat: r.imageFormat!,
        maxHeight: r.maxHeight!,
        maxWidth: r.maxWidth!,
        timeMs: r.timeMs!,
        quality: r.quality!))!;
  }

  int _imageDataSize = bytes.length;
  print("image size: $_imageDataSize");

  final _image = Image.memory(bytes);
  _image.image
      .resolve(ImageConfiguration())
      .addListener(ImageStreamListener((ImageInfo info, bool _) {
    completer.complete(ThumbnailResult(
      image: _image,
      dataSize: _imageDataSize,
      height: info.image.height,
      width: info.image.width,
    ));
  }));
  return completer.future;
}

class GenThumbnailImage extends StatefulWidget {
  final ThumbnailRequest? thumbnailRequest;

  const GenThumbnailImage({Key? key, this.thumbnailRequest}) : super(key: key);

  @override
  _GenThumbnailImageState createState() => _GenThumbnailImageState();
}

class _GenThumbnailImageState extends State<GenThumbnailImage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ThumbnailResult>(
      future: genThumbnail(widget.thumbnailRequest!),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final _image = snapshot.data.image;

          return _image;
        } else if (snapshot.hasError) {
          return Container(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Error:\n${snapshot.error.toString()}",
            ),
          );
        } else {
          return Container(
              height: MediaQuery.of(context).size.height * 0.20,
              child: Center(child: Loading()));
        }
      },
    );
  }
}

class ImageInFile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class VideoMessage extends StatefulWidget {
  final ReportModel report;
  final bool isReply;

  const VideoMessage({Key? key, required this.report, this.isReply = false})
      : super(key: key);
  @override
  _VideoMessageState createState() => _VideoMessageState();
}

class _VideoMessageState extends State<VideoMessage> {
  ImageFormat _format = ImageFormat.JPEG;
  int _quality = 50;
  int _sizeH = 0;
  int _sizeW = 0;
  int _timeMs = 0;

  GenThumbnailImage? _futreImage;

  String? tempDir;

  @override
  void initState() {
    super.initState();
    getTemporaryDirectory().then((d) => tempDir = d.path);

    getImageThumb();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isReply
          ? null
          : () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => VideoPlayer(
                            report: widget.report,
                          )));
            },
      child: widget.isReply
          ? Container(
              height: double.infinity,
              color: Colors.black,
              width: 60,
              child: (_futreImage != null) ? _futreImage! : SizedBox(),
            )
          : Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.75,
                  minWidth: 0.05),
              child: (_futreImage != null) ? _futreImage! : SizedBox()),
    );
  }

  getImageThumb() async {
    setState(() {
      _futreImage = GenThumbnailImage(
          thumbnailRequest: ThumbnailRequest(
              video: widget.report.media!,
              thumbnailPath: null,
              imageFormat: _format,
              maxHeight: _sizeH,
              maxWidth: _sizeW,
              timeMs: _timeMs,
              quality: _quality));
    });
  }
}
