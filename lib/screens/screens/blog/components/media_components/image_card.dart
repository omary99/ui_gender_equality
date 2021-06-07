import 'package:flutter/material.dart';
import 'package:gender_equality/models/report_model.dart';

class ImageCard extends StatelessWidget {
  final ReportModel report;
  const ImageCard({Key? key, required this.report}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AspectRatio(
        aspectRatio: 1.7,
        child: ClipRRect(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(report.media.first), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
