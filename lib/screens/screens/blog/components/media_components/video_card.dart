import 'package:flutter/material.dart';
import 'package:gender_equality/constants/test.dart';
import 'package:gender_equality/models/report_model.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({Key? key,required this.report}) : super(key: key);
  final ReportModel report;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.70,
                      minWidth: MediaQuery.of(context).size.width * 0.05),
                  padding: EdgeInsets.all(8.0),
                  child:  VideoContainer(play: false,   videoUrl: report.media,),
                  decoration: BoxDecoration(
                    color: Colors.teal.withOpacity(0.5),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(5)),
                  ),
                ),
                Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Center(child: Icon(Icons.play_arrow_rounded))),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: Container(
                    color: Colors.grey.withOpacity(0.2),
                    child: Icon(
                      Icons.check,
                      size: 15.0,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
