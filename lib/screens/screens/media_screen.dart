import 'package:flutter/material.dart';
import 'package:gender_equality/constants/enum.dart';
import 'package:gender_equality/constants/test.dart';
import 'package:gender_equality/services/services.dart';
import 'package:provider/provider.dart';

class MediaScreen extends StatefulWidget {
  const MediaScreen({Key? key}) : super(key: key);

  @override
  _MediaScreenState createState() => _MediaScreenState();
}

class _MediaScreenState extends State<MediaScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final _reportService = Provider.of<ReportService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Images'),
      ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Column(
              children: [
                Container(
                  color: Colors.black,
                  child: Center(
                    child: _reportService.seletedFileType == FileType.Image ? AspectRatio(
                      aspectRatio: 1.0,
                      child: Image.file(
                        _reportService.selectedMediaFile!,
                        fit: BoxFit.cover,
                      ),
                    ): 
                    
                    VideoContainer(
                      
                    
                      play: true, videoFile: _reportService.selectedMediaFile!),
                  ),
                ),
              ],
            ),
            Visibility(visible: _isLoading, child: CircularProgressIndicator())
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Positioned(
          bottom: 10.0,
          right: 10.0,
          child: Container(
              height: 40,
              width: 40,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      _isLoading = true;
                    });
                    _reportService
                        .sendReportWithMedia("media_file")
                        .then((value) {
                      setState(() {
                        _isLoading = false;
                      });
                      Navigator.pop(context);
                    });
                  },
                  icon: Icon(Icons.send))),
        ),
      ),
    );
  }
}
