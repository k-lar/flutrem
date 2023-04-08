import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          DrawerHeader(
            child: Center(child: Text(
              'Flutrem',
              style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Author:'),
            subtitle: Text('K_Lar'),
          ),
          ListTile(
            leading: Icon(Icons.link),
            title: Text('Project GitLab:'),
            subtitle: Text('https://gitlab.com/k_lar/flutrem'),
          ),
        ],
      ),
    );
    //Drawer(
    //  child: ListView(
    //    padding: EdgeInsets.zero,
    //    children: const <Widget>[
    //      DrawerHeader(
    //        child: Text(
    //          'Flutrem',
    //          style: TextStyle(fontSize: 25),
    //        ),
    //      ),
    //      ListTile(
    //        leading: Icon(Icons.person),
    //        title: Text('Author:'),
    //        subtitle: Text('K_Lar'),
    //      ),
    //      ListTile(
    //        leading: Icon(Icons.link),
    //        title: Text('Project GitLab:'),
    //        subtitle: Text('https://gitlab.com/k_lar/flutrem'),
    //      ),
    //    ],
    //  ),
    //);
  }
}
