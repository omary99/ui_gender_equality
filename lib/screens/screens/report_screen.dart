import 'package:flutter/material.dart';
import 'package:gender_equality/models/report_model.dart';
import 'package:gender_equality/screens/screens/blog/components/media_components/audio_card.dart';
import 'package:gender_equality/screens/screens/blog/components/media_components/image_card.dart';
import 'package:gender_equality/screens/screens/blog/components/media_components/text_card.dart';
import 'package:gender_equality/screens/screens/blog/components/media_components/video_card.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.builder(
              itemBuilder: (_, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: _getReport(mediaSamplesData[index]),
                );
              },
              itemCount: mediaSamplesData.length),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.face, color: Colors.black),
                        onPressed: () {},
                      ),
                      Expanded(child: TextField()),
                      Icon(Icons.attach_file),
                      Icon(Icons.camera_alt),
                      SizedBox(
                        width: 5,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                height: 40,
                width: 40,
                child: Center(
                  child: Icon(
                    Icons.mic,
                    color: Colors.white,
                  ),
                ),
                decoration:
                    BoxDecoration(color: Colors.teal, shape: BoxShape.circle),
              )
            ],
          ),
        )
      ],
    );
  }

  _getReport(ReportModel report) {
    switch (report.mediaType) {
      case 'audio':
        return AudioCard();
      case 'video':
        return VideoCard();
      case 'image':
        return ImageCard(
          report: report,
        );
      default:
        return TextCard(
          report: report,
        );
    }
  }
}
