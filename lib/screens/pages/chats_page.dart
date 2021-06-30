import 'package:flutter/material.dart';

class ChatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Row photos'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.75,
                              minWidth:
                                  MediaQuery.of(context).size.width * 0.05),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                'data of the data for the data by the data true data or false data',
                                style: TextStyle(color: Colors.black),
                                maxLines: 16,
                                overflow: TextOverflow.ellipsis),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.teal.withOpacity(0.5),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0.69),
                                topRight: Radius.circular(5),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(5)),
                          ),
                        ),
                        Positioned(
                            bottom: 1,
                            right: 1,
                            child: Icon(Icons.check,
                                size: 15.0, color: Colors.white)),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.70,
                              minWidth:
                                  MediaQuery.of(context).size.width * 0.05),
                          padding: EdgeInsets.all(8.0),
                          child: Image(
                            image:
                                NetworkImage("https://picsum.photos/200/300"),
                            fit: BoxFit.cover,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.teal.withOpacity(0.5),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(5),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(5)),
                          ),
                        ),
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
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.70,
                              minWidth:
                                  MediaQuery.of(context).size.width * 0.05),
                          padding: EdgeInsets.all(8.0),
                          child: Image(
                            image:
                                NetworkImage("https://picsum.photos/200/300"),
                            fit: BoxFit.cover,
                          ),
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
                            child:
                                Center(child: Icon(Icons.play_arrow_rounded))),
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
                Row(children: [Container(
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.teal.withOpacity(0.5)),
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
            ),)],)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
