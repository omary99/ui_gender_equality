import 'package:flutter/material.dart';
import 'package:gender_equality/models/report_model.dart';

class TextCard extends StatelessWidget {
  final ReportModel report;
  const TextCard({Key? key, required this.report}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.75,
                    minWidth: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: report.caption.isNotEmpty
                        ? Text(
                            report.caption,
                            style: TextStyle(color: Colors.black),
                            maxLines: 16,
                            overflow: TextOverflow.ellipsis,
                          )
                        : Text('Hello there is no caption yet'),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(5),
                    ),
                    color: Colors.teal.withOpacity(0.5),
                  ),
                ),
                Positioned(
                    bottom: 3,
                    right: 3,
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 15,
                    ))
              ],
            )
          ],
        )
      ],
    );
   
  }
}
