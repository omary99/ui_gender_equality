import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.46,
        height: 250,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.6,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image:
                                NetworkImage('https://picsum.photos/200/300'),
                            fit: BoxFit.cover,
                          )),
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
                        child: Text(
                          '2:09',
                          style: TextStyle(color: Colors.white),
                        ),
                      ))
                ],
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
        ));
  }
}
