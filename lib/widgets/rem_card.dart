import 'package:flutter/material.dart';
import '../models/rem_model.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class Remindercard extends StatefulWidget {
  final int id;
  final String title;
  final DateTime creationDate;
  bool isChecked;
  final Function insertFunction;
  final Function deleteFunction;
  Remindercard(
      {required this.id,
      required this.title,
      required this.creationDate,
      required this.isChecked,
      required this.insertFunction, // Handle checkbox changes
      required this.deleteFunction, // Handle delete button
      Key? key})
      : super(key: key);

  @override
  State<Remindercard> createState() => _RemindercardState();
}

class _RemindercardState extends State<Remindercard> {
  @override
  Widget build(BuildContext context) {
    var anotherRem = Reminder(
        id: widget.id,
        title: widget.title,
        creationDate: widget.creationDate,
        isChecked: widget.isChecked);

    return Card(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Checkbox(
              value: widget.isChecked,
              onChanged: (bool? value) {
                setState(() {
                  widget.isChecked = value!;
                });
                anotherRem.isChecked = value!;
                widget.insertFunction(anotherRem);
              },
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  DateFormat('dd MMM yyyy - hh:mm aaa')
                      .format(widget.creationDate),
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8F8F8F)),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                widget.deleteFunction(anotherRem);
              },
              icon: const Icon(Icons.close))
        ],
      ),
    );
  }
}
