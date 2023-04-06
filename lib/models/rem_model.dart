class Reminder {
  int? id;
  final String title;
  DateTime creationDate;
  bool isChecked;

  // Constructor for reminders
  Reminder(
      {this.id,
      required this.title,
      required this.creationDate,
      required this.isChecked});

  // To save data in the database, it needs to be converted into a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'creationDate': creationDate.toString(),
      'isChecked': isChecked ? 1 : 0,
    };
  }

  @override
  String toString() {
    return 'Reminder(id : $id, title : $title, creationDate : $creationDate, isChecked : $isChecked)';
  }
}
