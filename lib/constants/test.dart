import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoContainer extends StatefulWidget {
  final File? videoFile;
  final bool play;
  final String? videoUrl;

  const VideoContainer(
      {Key? key, this.videoFile, required this.play, this.videoUrl})
      : super(key: key);
  @override
  _VideoContainerState createState() => _VideoContainerState();
}

class _VideoContainerState extends State<VideoContainer> {
  VideoPlayerController? _controller;

  bool initialized = false;

  @override
  void initState() {
    _initVideo();
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  _initVideo() async {
    widget.videoFile != null
        ? _controller = VideoPlayerController.file(widget.videoFile!)
        : _controller = VideoPlayerController.network(widget.videoUrl!)

      // Play the video again when it ends
      ..setLooping(true)
      // initialize the controller and notify UI when done
      ..initialize().then((_) => setState(() => initialized = true));
  }

  @override
  Widget build(BuildContext context) {
    return initialized
        // If the video is initialized, display it
        ? Container(
            child: AspectRatio(
              aspectRatio: _controller!.value.aspectRatio,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: VideoPlayer(_controller!)),
                  GestureDetector(
                    onTap: widget.play
                        ? () {
                            // Wrap the play or pause in a call to `setState`. This ensures the
                            // correct icon is shown.
                            setState(() {
                              // If the video is playing, pause it.
                              if (_controller!.value.isPlaying) {
                                _controller!.pause();
                              } else {
                                // If the video is paused, play it.
                                _controller!.play();
                              }
                            });
                          }
                        : null,
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _controller!.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        size: 15,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
