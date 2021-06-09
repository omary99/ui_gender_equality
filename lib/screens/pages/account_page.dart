import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.lock, color: Colors.teal,),
            title: Text('Privacy'),
          ),
            ListTile(
            leading: Icon(Icons.security, color: Colors.teal,),
            title: Text('Security'),
          ),
            ListTile(
            leading: Icon(Icons.password, color: Colors.teal,),
            title: Text('Two-step verification'),
          ),
            ListTile(
            leading: Icon(Icons.price_change_outlined, color: Colors.teal,),
            title: Text('Change number'),
          ),
            ListTile(
            leading: Icon(Icons.request_page, color: Colors.teal,),
            title: Text('Request account info'),
          ),
            ListTile(
            leading: Icon(Icons.logout_outlined, color: Colors.teal,),
            title: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
