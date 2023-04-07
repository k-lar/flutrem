import 'package:flutrem/screens/about.dart';
import 'package:flutrem/screens/easteregg.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: Text(
              'Remind your\nmom',
              style: TextStyle(fontSize: 25),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => {
              //  Navigator.push(context,
              //      MaterialPageRoute(builder: (context) => const EasterEgg()))
            },
            onLongPress: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const EasterEgg()))
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const About()))
            },
          ),
        ],
      ),
    );
  }
}
