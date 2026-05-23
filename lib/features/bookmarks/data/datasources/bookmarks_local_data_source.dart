import '../../../../core/database/local_database.dart';

abstract class BookmarksLocalDataSource {
  Future<List<Map<String, dynamic>>> getAllBookmarks();
  Future<int> insertBookmark({
    required String id,
    required String type,
    required Map<String, dynamic> data,
  });
  Future<int> deleteBookmark(String id);
  Future<bool> isBookmarked(String id);
  Future<Map<String, dynamic>?> getBookmark(String id);
}

class BookmarksLocalDataSourceImpl implements BookmarksLocalDataSource {
  final LocalDatabase _localDatabase;

  BookmarksLocalDataSourceImpl(this._localDatabase);

  @override
  Future<List<Map<String, dynamic>>> getAllBookmarks() {
    return _localDatabase.getAllBookmarks();
  }

  @override
  Future<int> insertBookmark({
    required String id,
    required String type,
    required Map<String, dynamic> data,
  }) {
    return _localDatabase.insertBookmark(
      id: id,
      type: type,
      data: data,
    );
  }

  @override
  Future<int> deleteBookmark(String id) {
    return _localDatabase.deleteBookmark(id);
  }

  @override
  Future<bool> isBookmarked(String id) {
    return _localDatabase.isBookmarked(id);
  }

  @override
  Future<Map<String, dynamic>?> getBookmark(String id) {
    return _localDatabase.getBookmark(id);
  }
}
