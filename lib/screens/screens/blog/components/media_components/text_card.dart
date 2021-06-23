import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gender_equality/models/report_model.dart';

class TextCard extends StatelessWidget {
  final ReportModel report;
  const TextCard({Key? key, required this.report}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        child: Column(
          children: [
            report.caption.isNotEmpty
                ? Text(
                    report.caption,
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                  )
                : Text('Hello there is no caption yet'),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FaIcon(
                  FontAwesomeIcons.checkDouble,
                  size: 15,
                  color: Colors.blue,
                ),
                Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete,
                      color: Colors.green,
                    )),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit,
                      color: Colors.green,
                    )),
              ],
            )
          ],
        ));
  }
}
