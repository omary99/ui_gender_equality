import 'package:flutter/material.dart';

class AudioCard extends StatelessWidget {
  const AudioCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.teal, borderRadius: BorderRadius.circular(10)),
        child: Row(

          children: [
            SizedBox(width: 5,),
            CircleAvatar(
              backgroundImage: NetworkImage('https://picsum.photos/200/300'),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.play_arrow,
              color: Colors.grey,
              size: 30,
            ),
            Slider(
              activeColor: Colors.grey,
              value: 0.0, onChanged: (value) {})
          ],
        ),
      ),
    );
  }
}
