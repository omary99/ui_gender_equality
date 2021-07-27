import 'dart:async';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:gender_equality/models/report_model.dart';
import 'package:gender_equality/screens/screens/blog/components/media_components/audio_card.dart';
import 'package:gender_equality/screens/screens/blog/components/media_components/image_card.dart';
import 'package:gender_equality/screens/screens/blog/components/media_components/text_card.dart';
import 'package:gender_equality/screens/screens/blog/components/media_components/video_card.dart';
import 'package:gender_equality/screens/screens/media_screen.dart';
import 'package:gender_equality/services/services.dart';
import 'package:gender_equality/wechat/pages/gallery_page.dart';
import 'package:provider/provider.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  FocusNode _focusNode = FocusNode();
  double _containerHeight = 0.0;
  bool _attachmentContainerIsOpened = false;
  bool _showButton = false;
  final TextEditingController _controller = TextEditingController();
  bool emojiShowing = false;

  _onEmojiSelected(Emoji emoji) {
    _controller
      ..text += emoji.emoji
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
  }

  _onBackspacePressed() {
    _controller
      ..text = _controller.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
  }

  bool _sendMessage = false;

  final _formKey = GlobalKey<FormState>();

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
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                child: AnimatedContainer(
                  height: _containerHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  duration: Duration(milliseconds: 1),
                  curve: Curves.fastOutSlowIn,
                  child: _showButton
                      ? Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.blueGrey,
                                        ),
                                        height: 50,
                                        width: 50,
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.audiotrack,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("Audio",
                                          style: TextStyle(color: Colors.grey))
                                    ],
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.pink,
                                        ),
                                        height: 50,
                                        width: 50,
                                        child: IconButton(
                                          onPressed: () {
                                            _reportService
                                                .chooseImage()
                                                .then((value) {
                                              if (value) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            MediaScreen()));
                                              }
                                            });
                                            setState(() {
                                              _containerHeight = 0.0;
                                              _attachmentContainerIsOpened =
                                                  false;
                                              _showButton = false;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.image,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Image",
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.purple,
                                        ),
                                        height: 50,
                                        width: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              _reportService
                                                  .chooseVideo()
                                                  .then((value) {
                                                if (value) {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (_) =>
                                                              MediaScreen()));
                                                }
                                              });
                                              setState(() {
                                                _containerHeight = 0.0;
                                                _attachmentContainerIsOpened =
                                                    false;
                                                _showButton = false;
                                              });
                                            },
                                            icon: Icon(
                                              Icons.video_label,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text("Video",
                                          style: TextStyle(color: Colors.grey))
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      : Container(),
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                              icon: Icon(Icons.face, color: Colors.teal),
                              onPressed: () {
                                setState(() {
                                  emojiShowing = !emojiShowing;
                                  _sendMessage = emojiShowing;
                                });

                                if (emojiShowing) {
                                  dismissKebody();
                                } else
                                  showKebody();
                              },
                            ),
                            Expanded(
                                child: TextFormField(
                              decoration: InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  hintText: "Type message"),
                              focusNode: _focusNode,
                              controller: _controller,
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
                            )),
                            IconButton(
                                onPressed: () {
                                  if (_attachmentContainerIsOpened) {
                                    setState(() {
                                      _containerHeight = 0.0;
                                      _attachmentContainerIsOpened = false;
                                      _showButton = false;
                                    });
                                  } else
                                    setState(() {
                                      _containerHeight = 200.0;
                                      _attachmentContainerIsOpened = true;
                                    });
                                  Timer(Duration(seconds: 2), () {
                                    setState(() {
                                      _showButton = true;
                                    });
                                  });
                                },
                                icon: Icon(
                                  Icons.attach_file,
                                  color: Colors.teal,
                                )),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => GalleryPage()));
                              },
                              icon: Icon(
                                Icons.camera_alt,
                                color: Colors.teal,
                              ),
                            ),
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
                                      .sendReports(_controller.text)
                                      .then((value) {
                                    if (!value) {
                                      _controller.clear();
                                    }
                                  });
                                }
                              },
                              icon: Icon(
                                _sendMessage ? Icons.send : Icons.mic,
                                color: Colors.white,
                              ))),
                      decoration: BoxDecoration(
                          color: Colors.teal, shape: BoxShape.circle),
                    )
                  ],
                ),
              ),
            ),
            Offstage(
              offstage: !emojiShowing,
              child: SizedBox(
                height: 250,
                child: EmojiPicker(
                    onEmojiSelected: (Category category, Emoji emoji) {
                      _onEmojiSelected(emoji);
                    },
                    onBackspacePressed: _onBackspacePressed,
                    config: const Config(
                        columns: 7,
                        emojiSizeMax: 32.0,
                        verticalSpacing: 0,
                        horizontalSpacing: 0,
                        initCategory: Category.RECENT,
                        bgColor: Color(0xFFF2F2F2),
                        indicatorColor: Colors.teal,
                        iconColor: Colors.grey,
                        iconColorSelected: Colors.teal,
                        progressIndicatorColor: Colors.teal,
                        backspaceColor: Colors.teal,
                        showRecentsTab: true,
                        recentsLimit: 28,
                        noRecentsText: 'No Recents',
                        noRecentsStyle:
                            TextStyle(fontSize: 20, color: Colors.black26),
                        categoryIcons: CategoryIcons(),
                        buttonMode: ButtonMode.MATERIAL)),
              ),
            ),
          ],
        ),
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

  showKebody() {
    _focusNode.requestFocus();
  }

  dismissKebody() {
    _focusNode.unfocus();
  }
}
