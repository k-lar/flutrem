import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'rem_model.dart';

class DatabaseConnect {
  Database? _database;

  Future<Database> get database async {
    final dbpath = await getDatabasesPath();
    const dbname = 'rem.db';
    final path = join(dbpath, dbname);

    _database = await openDatabase(path, version: 1, onCreate: _createDB);

    return _database!;
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE rem(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        creationDate TEXT,
        isChecked INTEGER
      )
    ''');
  }

  Future<void> insertRem(Reminder reminder) async {
    final db = await database;
    await db.insert(
      'rem',
      reminder.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace, // remove duplicate entries
    );
  }

  Future<void> deleteRem(Reminder reminder) async {
    final db = await database;
    await db.delete(
      'rem',
      where: 'id == ?',
      whereArgs: [reminder.id],
    );
  }

  Future<List<Reminder>> getReminders() async {
    final db = await database;

    List<Map<String, dynamic>> items = await db.query(
      'rem',
      orderBy: 'id DESC',
    );
    return List.generate(
        items.length,
        (i) => Reminder(
              id: items[i]['id'],
              title: items[i]['title'],
              creationDate: DateTime.parse(items[i]['creationDate']),
              isChecked: items[i]['isChecked'] == 1
                  ? true
                  : false, // Convert from int to bool
            ));
  }
}
