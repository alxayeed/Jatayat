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
      version: 2,
      onCreate: _createDB,
      onUpgrade: _upgradeDB,
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

    // 🛠️ Settings Table (key-value store for user preferences)
    await db.execute('''
      CREATE TABLE settings (
        key TEXT PRIMARY KEY,
        value TEXT NOT NULL
      )
    ''');
  }

  Future _upgradeDB(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      // Migration: Add settings table for existing users
      await db.execute('''
        CREATE TABLE settings (
          key TEXT PRIMARY KEY,
          value TEXT NOT NULL
        )
      ''');
    }
  }

  // ── Settings Operations ───────────────────────────────────────────────────

  Future<String?> getSetting(String key) async {
    final db = await instance.database;
    final maps = await db.query(
      'settings',
      columns: ['value'],
      where: 'key = ?',
      whereArgs: [key],
    );
    if (maps.isNotEmpty) {
      return maps.first['value'] as String;
    }
    return null;
  }

  Future<void> setSetting(String key, String value) async {
    final db = await instance.database;
    await db.insert(
      'settings',
      {'key': key, 'value': value},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // ── Bookmark Operations ───────────────────────────────────────────────────

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
