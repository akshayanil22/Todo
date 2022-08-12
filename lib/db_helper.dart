import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_manager/todo_model.dart';

class DBHelper{
  static final _databaseName = 'todo.db';
  static final _todo_table = 'todo_table';
  static final _databaseVersion = 1;
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDB();
    return _database!;
  }

  _initDB() async {
    String path = join(await getDatabasesPath(), _databaseName);

    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE $_todo_table('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, title STRING, date STRING,isDone BOOLEAN'
        ')');
  }

  Future<int> insertTask(TodoModel task) async {
    Database? db = DBHelper._database;
    return await db!.insert(_todo_table, {
      'title': task.title,
      'date': task.date,
      'isDone': task.isDone,
    });
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database? db = DBHelper._database;
    return await db!.query(_todo_table);
  }
}