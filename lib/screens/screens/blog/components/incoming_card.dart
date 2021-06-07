import 'package:flutter/material.dart';
import 'package:gender_equality/models/message_model.dart';

class IncomingCard extends StatelessWidget {
  final MessageModel message;
  IncomingCard({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Text(message.text, style: TextStyle(color: Colors.black),),
      decoration: BoxDecoration(
        color: Colors.teal.withOpacity(message.isSentByMe ? 0.8 : 0.5),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(message.isSentByMe ? 15 : 0),
            topRight: Radius.circular(message.isSentByMe ? 0 : 15),
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
      ),
    );
  }
}
