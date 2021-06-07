import 'package:flutter/material.dart';
import 'package:gender_equality/models/report_model.dart';

class TextCard extends StatelessWidget {
  final ReportModel report;
  const TextCard({Key? key, required this.report}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Text(
          report.caption,
          style: Theme.of(context).textTheme.bodyText1,
          maxLines: 10,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
