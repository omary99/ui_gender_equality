import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AudioCard extends StatelessWidget {
  const AudioCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(0),
          child: Container(
            height: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 5,
                ),
                CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://picsum.photos/200/300'),
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
                    activeColor: Colors.white,
                    value: 0.0,
                    onChanged: (value) {})
              ],
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
