import 'dart:convert';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static final LocalDatabase instance = LocalDatabase._init();
  static Database? _database;

  LocalDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('jatayat.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    // 🛠️ Unified Bookmarks Table
    // id: TEXT PRIMARY KEY (Route ID or Fare ID)
    // type: TEXT (e.g., 'route' or 'fare')
    // data: TEXT (Serialized JSON of BusRoute or FareResultEntity)
    // created_at: INTEGER (Timestamp for sorting)
    await db.execute('''
      CREATE TABLE bookmarks (
        id TEXT PRIMARY KEY,
        type TEXT NOT NULL,
        data TEXT NOT NULL,
        created_at INTEGER NOT NULL
      )
    ''');
  }

  // ── Operations ─────────────────────────────────────────────────────────────

  Future<int> insertBookmark({
    required String id,
    required String type,
    required Map<String, dynamic> data,
  }) async {
    final db = await instance.database;
    return await db.insert(
      'bookmarks',
      {
        'id': id,
        'type': type,
        'data': jsonEncode(data),
        'created_at': DateTime.now().millisecondsSinceEpoch,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> deleteBookmark(String id) async {
    final db = await instance.database;
    return await db.delete(
      'bookmarks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<bool> isBookmarked(String id) async {
    final db = await instance.database;
    final maps = await db.query(
      'bookmarks',
      columns: ['id'],
      where: 'id = ?',
      whereArgs: [id],
    );
    return maps.isNotEmpty;
  }

  Future<Map<String, dynamic>?> getBookmark(String id) async {
    final db = await instance.database;
    final maps = await db.query(
      'bookmarks',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return maps.first;
    }
    return null;
  }

  Future<List<Map<String, dynamic>>> getAllBookmarks() async {
    final db = await instance.database;
    return await db.query('bookmarks', orderBy: 'created_at DESC');
  }

  Future<void> close() async {
    final db = _database;
    if (db != null) {
      await db.close();
    }
  }
}
