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
      version: 3,
      onCreate: _createDB,
      onUpgrade: _upgradeDB,
    );
  }

  Future _createDB(Database db, int version) async {
    // Unified Bookmarks Table
    await db.execute('''
      CREATE TABLE bookmarks (
        id TEXT PRIMARY KEY,
        type TEXT NOT NULL,
        data TEXT NOT NULL,
        created_at INTEGER NOT NULL
      )
    ''');

    // Settings Table (key-value store for user preferences)
    await db.execute('''
      CREATE TABLE settings (
        key TEXT PRIMARY KEY,
        value TEXT NOT NULL
      )
    ''');

    // local-first schema tables
    await _createLocalFirstTables(db);
  }

  Future _createLocalFirstTables(Database db) async {
    await db.execute('''
      CREATE TABLE stops (
        id TEXT PRIMARY KEY,
        name_bn TEXT,
        name_en TEXT,
        lat REAL,
        lng REAL,
        search_terms TEXT,
        region TEXT,
        route_codes TEXT,
        aliases_bn TEXT,
        is_active INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE routes (
        id TEXT PRIMARY KEY,
        route_code TEXT,
        name_bn TEXT,
        name_en TEXT,
        total_distance_km REAL,
        document_id TEXT,
        pdf_page_number INTEGER,
        region TEXT,
        total_stops INTEGER,
        revision_id TEXT,
        is_active INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE route_stops (
        id TEXT PRIMARY KEY,
        route_id TEXT,
        stop_id TEXT,
        sequence_order INTEGER,
        cumulative_distance_km REAL,
        revision_id TEXT,
        is_active INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE fares (
        id TEXT PRIMARY KEY,
        route_id TEXT,
        from_stop_id TEXT,
        to_stop_id TEXT,
        fare_amount INTEGER,
        travel_distance_km REAL,
        revision_id TEXT,
        is_active INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE documents (
        id TEXT PRIMARY KEY,
        title TEXT,
        pdf_url TEXT,
        btrc_url TEXT,
        issued_date TEXT,
        last_revised TEXT,
        total_pages INTEGER,
        region TEXT,
        notes TEXT,
        created_at TEXT,
        updated_at TEXT,
        revision_id TEXT,
        is_active INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE revisions (
        id TEXT PRIMARY KEY,
        name TEXT,
        base_fare_per_km REAL,
        minimum_fare INTEGER,
        effective_date TEXT,
        is_active INTEGER,
        created_at TEXT,
        updated_at TEXT,
        data_updated_at TEXT
      )
    ''');
  }

  Future _upgradeDB(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('''
        CREATE TABLE settings (
          key TEXT PRIMARY KEY,
          value TEXT NOT NULL
        )
      ''');
    }
    if (oldVersion < 3) {
      await _createLocalFirstTables(db);
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
