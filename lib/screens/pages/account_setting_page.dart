import 'package:flutter/material.dart';
import 'package:gender_equality/screens/pages/account_page.dart';
import 'package:gender_equality/screens/pages/edit_profile_page.dart';

class AccountSettingPage extends StatelessWidget {
  const AccountSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return EditProfilePage();
              }));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              height: 90,
              child: Row(
                children: [
                  CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          AssetImage('assets/images/beauty_one.jpg')),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Faith',
                          style: Theme.of(context).textTheme.subtitle1,
                          maxLines: 1,
                        ),
                        SizedBox(height: 5),
                        Text(
                          'What i like about picture is to capture memory',
                          style: Theme.of(context).textTheme.subtitle2,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.qr_code,
                    color: Colors.teal,
                  )
                ],
              ),
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return AccountPage();
              }));
            },
            child: ListTile(
              leading: Transform.rotate(
                  angle: 20.4, child: Icon(Icons.vpn_key, color: Colors.teal)),
              title: Text('Account'),
              subtitle: Text('Privacy, Security, change number'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.chat, color: Colors.teal),
            title: Text('Chats'),
            subtitle: Text('Themes, Wallpapers, chat history'),
          ),
          ListTile(
            leading: Icon(Icons.notifications, color: Colors.teal),
            title: Text('Notifications'),
            subtitle: Text('Message groups & call tones'),
          ),
          ListTile(
            leading: Icon(Icons.data_usage, color: Colors.teal),
            title: Text('Storage and Data'),
            subtitle: Text('Network usage, auto_download'),
          ),
          ListTile(
            leading: Icon(Icons.help, color: Colors.teal),
            title: Text('Help'),
            subtitle: Text('Help center, Contact us, privacy policy'),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.group,
              color: Colors.teal,
            ),
            title: Text('Invite a friend'),
          ),
        ],
      ),
    );
  }
}
