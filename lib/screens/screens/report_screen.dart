import 'package:flutter/material.dart';
import 'package:gender_equality/models/report_model.dart';
import 'package:gender_equality/screens/screens/blog/components/media_components/audio_card.dart';
import 'package:gender_equality/screens/screens/blog/components/media_components/image_card.dart';
import 'package:gender_equality/screens/screens/blog/components/media_components/text_card.dart';
import 'package:gender_equality/screens/screens/blog/components/media_components/video_card.dart';
import 'package:gender_equality/screens/screens/image_screen.dart';
import 'package:gender_equality/services/services.dart';
import 'package:provider/provider.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  bool _sendMessage = false;

  final _formKey = GlobalKey<FormState>();
  final _captionEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _reportService = Provider.of<ReportService>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.separated(
            itemBuilder: (_, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: _getReport(_reportService.reportList[index]),
              );
            },
            itemCount: _reportService.reportList.length,
            separatorBuilder: (BuildContext context, int index) => Divider(),
          ),
        ),
        Form(
          key: _formKey,
          child: Padding(
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
                        Expanded(
                            child: TextFormField(
                          controller: _captionEditingController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Caption required';
                            }

                            return null;
                          },
                          onChanged: (value) {
                            print(value);
                            if (value.isEmpty) {
                              setState(() {
                                _sendMessage = false;
                              });
                            } else {
                              setState(() {
                                _sendMessage = true;
                              });
                            }
                          },
                        )
                        ),
                        IconButton(
                            onPressed: () {
                              _reportService.chooseImage().then((value) {
                                if (value) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => ImageScreen()));
                                }
                              });
                            },
                            icon: Icon(Icons.attach_file)),
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
                      child: IconButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _reportService
                                  .sendReports(_captionEditingController.text)
                                  .then((value) {
                                if (!value) {
                                  _captionEditingController.clear();
                                }
                              });
                            }
                          },
                          icon: Icon(
                            _sendMessage ? Icons.send : Icons.mic,
                            color: Colors.white,
                          ))),
                  decoration:
                      BoxDecoration(color: Colors.teal, shape: BoxShape.circle),
                )
              ],
            ),
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
