import '../repositories/bookmarks_repository.dart';

class RemoveBookmarkUseCase {
  final BookmarksRepository _repository;

  RemoveBookmarkUseCase(this._repository);

  Future<void> call(String id) async {
    await _repository.removeBookmark(id);
  }
}
