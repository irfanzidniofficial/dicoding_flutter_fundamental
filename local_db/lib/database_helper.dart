import 'package:local_db/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static late Database _database;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  static const String _tableName = 'notes';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      join(path, 'note_db.db'),
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE $_tableName(
        id INTEGER PRIMARY KEY, title Text, description TEXT
      )''',
        );
      },
      version: 1,
    );
    return db;
  }
  // Fungsi untuk memanipulasi data

  Future<void> insertNote(Note note) async {
    final Database db = await database;
    await db.insert(_tableName, note.toMap());
    print('Data saved');
  }

  // Menampilkan seluruh note yang di simpan dalam database
  Future<List<Note>> getNotes() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName);

    return results.map((res) => Note.fromMap(res)).toList();
  }

  // Mengambil data dengan id tertentu
  Future<Note> getNoteById(int id) async {
    final Database db = await database;

    List<Map<String, dynamic>> results = await db.query(
      _tableName,
      where: 'id = ? ',
      whereArgs: [id],
    );
    return results.map((res) => Note.fromMap(res)).first;
  }

  // Metode untuk memperbarui data

  Future<void> updateNote(Note note) async {
    final db = await database;

    await db.update(
      _tableName,
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  // Metode menghapus data

  Future<void> deleteNote(int id) async {
    final db = await database;

    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
