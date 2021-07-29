import 'package:flutter/material.dart';
import 'package:gender_equality/models/report_model.dart';
import 'package:gender_equality/screens/screens/blog/components/media_components/audio_card.dart';
import 'package:gender_equality/screens/screens/blog/components/media_components/image_card.dart';
import 'package:gender_equality/screens/screens/blog/components/media_components/text_card.dart';
import 'package:gender_equality/screens/screens/blog/components/media_components/video_card.dart';
import 'package:gender_equality/screens/screens/components/input_field.dart';
import 'package:gender_equality/services/services.dart';
import 'package:provider/provider.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {


  @override
  Widget build(BuildContext context) {
    final _reportService = Provider.of<ReportService>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (_, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: _getReport(_reportService.reportList[index]),
              );
            },
            itemCount: _reportService.reportList.length,
          ),
        ),
InputField()

      ],
    );
  }

  _getReport(ReportModel report) {
    switch (report.mediaType) {
      case 'audio':
        return AudioCard();
      case 'video':
        return VideoCard(
          report: report,
        );
      case 'image':
        return ImageCard(
          report: report,
        );
      case 'text':
        return TextCard(
          report: report,
        );
      default:
        return TextCard(
          report: report,
        );
    }
  }


}
