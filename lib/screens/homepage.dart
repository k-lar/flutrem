import 'package:flutrem/models/database_model.dart';
import 'package:flutrem/models/rem_model.dart';
import 'package:flutrem/widgets/navdrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutrem/widgets/user_input.dart';
import 'package:flutrem/widgets/rem_list.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var db = DatabaseConnect();

  void addItem(Reminder reminder) async {
    await db.insertRem(reminder);
    setState(() {});
  }

  void deleteItem(Reminder reminder) async {
    await db.deleteRem(reminder);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: const Text('Flutrem'),
      ),
      body: Column(
        children: [
          RemList(insertFunction: addItem, deleteFunction: deleteItem),
          UserInput(insertFunction: addItem),
        ],
      ),
    );
  }
}
