import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ListView(
        children: [
          Container(
              height: 250,
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      height: 180,
                      width: 180,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://picsum.photos/200/300',
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 80,
                    bottom: 50,
                    child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.teal,
                        ),
                        child: Center(
                            child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ))),
                  ),
                ],
              )),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('name'),
            subtitle: Text('This name it appeared typer gtypot '),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('about'),
            subtitle: Text(
                'what i like about photography is that they capter a momemt that gone forever, impossible to reproduce'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('phone'),
            subtitle: Text('+255 684 623 872'),
          )
        ],
      ),
    );
  }
}
