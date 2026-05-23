import '../repositories/bookmarks_repository.dart';

class IsBookmarkedUseCase {
  final BookmarksRepository _repository;

  IsBookmarkedUseCase(this._repository);

  Future<bool> call(String id) async {
    return await _repository.isBookmarked(id);
  }
}
