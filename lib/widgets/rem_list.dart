import 'package:flutter/material.dart';
import 'package:flutrem/models/database_model.dart';
import 'rem_card.dart';

class RemList extends StatelessWidget {
  final Function insertFunction;
  final Function deleteFunction;
  final db = DatabaseConnect();

  RemList(
      {required this.insertFunction, required this.deleteFunction, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: db.getReminders(),
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          var data = snapshot.data;
          var datalength = data!.length;

          return datalength == 0
              ? const Center(
                  child: Text('No reminders found'),
                )
              : ListView.builder(
                  itemCount: datalength,
                  itemBuilder: (context, i) => Remindercard(
                    id: data[i].id,
                    title: data[i].title,
                    creationDate: data[i].creationDate,
                    isChecked: data[i].isChecked,
                    insertFunction: insertFunction,
                    deleteFunction: deleteFunction,
                  ),
                );
        },
      ),
    );
  }
}
