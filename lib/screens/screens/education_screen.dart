import 'package:flutter/material.dart';
import 'package:gender_equality/models/message_model.dart';
import 'package:gender_equality/screens/screens/blog/components/message_card.dart';

class EducationScreen extends StatefulWidget {
   EducationScreen({Key? key}) : super(key: key);

  @override
  _EducationScreenState createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  bool _sendMessage = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: sampleMessagesData[index].isSentByMe
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        IncomingCard(
                          message: sampleMessagesData[index],
                        ),
                      ],
                    ),
                  );
                },
                itemCount: sampleMessagesData.length),
          ),
        ),
        Padding(
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
                      Expanded(child: TextField(
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
                      ))
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
                  child: Icon(
                   _sendMessage? Icons.send: Icons.mic,
                    color: Colors.white,
                  ),
                ),
                decoration:
                    BoxDecoration(color: Colors.teal, shape: BoxShape.circle),
              )
            ],
          ),
        )
      ],
    );
  }
}
