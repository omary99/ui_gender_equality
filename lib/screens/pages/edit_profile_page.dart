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
          Container(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Name'),
                  subtitle: Text(
                    'Faith',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  trailing: Icon(
                    Icons.edit,
                    color: Colors.teal,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 70.0),
                  child: Text(
                    'This is not your username or pin. This name will be visible to your watsap contacts',
                    maxLines: 2,
                  ),
                )
              ],
            ),
          ),
          Divider(
            endIndent: 10,
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text(
              'About',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            subtitle: Text(
              'what i like about photography is that they capter a momemt that gone forever, impossible to reproduce',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            trailing: Icon(
              Icons.edit,
              color: Colors.teal,
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text(
              'Phone',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            subtitle: Text(
              '+255 684 623 872',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          )
        ],
      ),
    );
  }
}
