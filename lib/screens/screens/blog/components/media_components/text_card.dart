import 'package:flutter/material.dart';
import 'package:gender_equality/models/report_model.dart';

class TextCard extends StatelessWidget {
  final ReportModel report;
  const TextCard({Key? key, required this.report}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal.withOpacity(0.5)
      ),
      child: Text(
        report.caption,
        style: Theme.of(context).textTheme.bodyText1,
        maxLines: 10,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
