import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gender_equality/models/report_model.dart';

class ImageCard extends StatelessWidget {
  final ReportModel report;
  const ImageCard({Key? key, required this.report}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AspectRatio(
            aspectRatio: 1.7,
            child: ClipRRect(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: report.media.isNotEmpty
                          ? NetworkImage(report.media.first)
                          : NetworkImage('https://picsum.photos/200/300'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ),
        Row(
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
                ))
          ],
        )
      ],
    );
  }
}
