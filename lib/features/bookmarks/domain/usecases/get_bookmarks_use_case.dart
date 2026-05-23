import '../entities/bookmark_item.dart';
import '../repositories/bookmarks_repository.dart';

class GetBookmarksUseCase {
  final BookmarksRepository _repository;

  GetBookmarksUseCase(this._repository);

  Future<List<BookmarkItem>> call() async {
    return await _repository.getBookmarks();
  }
}
