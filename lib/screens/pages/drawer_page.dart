import 'package:flutter/material.dart';
import 'package:gender_equality/screens/pages/account_setting_page.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountEmail: Text(
              "faithomary@gmail.com",
              style: TextStyle(fontSize: 20),
            ),
            accountName: Text(
              "Faith Omary",
              style: TextStyle(fontSize: 20),
            ),
            currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/beauty_one.jpg')),
            decoration: BoxDecoration(color: Colors.teal),
          ),
          ListTile(
            leading: Icon(
              Icons.report,
            ),
            title: Text(
              "Report",
            ),
          ),
          ListTile(
            leading: Icon(Icons.drafts_outlined),
            title: Text(
              "Draft",
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.delete,
            ),
            title: Text(
              "Bin",
            ),
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return AccountSettingPage();
              }));
            },
            leading: Icon(
              Icons.settings,
            ),
            title: Text(
              "Settings",
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.feedback,
            ),
            title: Text(
              "Help/ Feedback",
            ),
          ),
        ],
      ),
    );
  }
}
