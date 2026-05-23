# Implementation Plan - Refactoring Bookmarks to Clean Architecture

Refactor the newly implemented Bookmarks feature to strictly adhere to the project's Clean Architecture standards (Domain, Data, and Presentation separation with Riverpod dependency injection).

---

## Proposed Changes

### 1. Domain Layer (Entities & Repository Abstract Interface)

#### [NEW] [bookmark_item.dart](file:///mnt/BACKUP/WORKSHOP/Personal/Projects/Jatayat/repo/jatayat/lib/features/bookmarks/domain/entities/bookmark_item.dart)
* Extract `BookmarkItem` from presentation layer provider to domain entity.

#### [NEW] [bookmarks_repository.dart](file:///mnt/BACKUP/WORKSHOP/Personal/Projects/Jatayat/repo/jatayat/lib/features/bookmarks/domain/repositories/bookmarks_repository.dart)
* Define `BookmarksRepository` abstract contract:
  ```dart
  abstract class BookmarksRepository {
    Future<List<BookmarkItem>> getBookmarks();
    Future<void> addRouteBookmark(BusRoute route);
    Future<void> addFareBookmark(FareResultEntity fare);
    Future<void> removeBookmark(String id);
    Future<bool> isBookmarked(String id);
  }
  ```

---

### 2. Domain Layer (Use Cases)

#### [NEW] [get_bookmarks_use_case.dart](file:///mnt/BACKUP/WORKSHOP/Personal/Projects/Jatayat/repo/jatayat/lib/features/bookmarks/domain/usecases/get_bookmarks_use_case.dart)
* Retrieves all saved bookmarks.

#### [NEW] [add_route_bookmark_use_case.dart](file:///mnt/BACKUP/WORKSHOP/Personal/Projects/Jatayat/repo/jatayat/lib/features/bookmarks/domain/usecases/add_route_bookmark_use_case.dart)
* Persists a bookmarked bus route.

#### [NEW] [add_fare_bookmark_use_case.dart](file:///mnt/BACKUP/WORKSHOP/Personal/Projects/Jatayat/repo/jatayat/lib/features/bookmarks/domain/usecases/add_fare_bookmark_use_case.dart)
* Persists a bookmarked fare search result.

#### [NEW] [remove_bookmark_use_case.dart](file:///mnt/BACKUP/WORKSHOP/Personal/Projects/Jatayat/repo/jatayat/lib/features/bookmarks/domain/usecases/remove_bookmark_use_case.dart)
* Removes a bookmark by ID.

#### [NEW] [is_bookmarked_use_case.dart](file:///mnt/BACKUP/WORKSHOP/Personal/Projects/Jatayat/repo/jatayat/lib/features/bookmarks/domain/usecases/is_bookmarked_use_case.dart)
* Checks bookmark status for details screens.

---

### 3. Data Layer (Data Sources & Models)

#### [NEW] [bookmarks_local_data_source.dart](file:///mnt/BACKUP/WORKSHOP/Personal/Projects/Jatayat/repo/jatayat/lib/features/bookmarks/data/datasources/bookmarks_local_data_source.dart)
* Define local data source abstract and concrete implementation that communicates directly with `LocalDatabase`.

#### [NEW] [bookmarks_repository_impl.dart](file:///mnt/BACKUP/WORKSHOP/Personal/Projects/Jatayat/repo/jatayat/lib/features/bookmarks/data/repositories/bookmarks_repository_impl.dart)
* Implement `BookmarksRepository` contract, handles JSON deserialization/serialization of entities.

---

### 4. Dependency Injection (Riverpod)

#### [MODIFY] [core_providers.dart](file:///mnt/BACKUP/WORKSHOP/Personal/Projects/Jatayat/repo/jatayat/lib/core/di/core_providers.dart)
* Expose `LocalDatabase.instance` as a provider for the data source.

#### [MODIFY] [data_source_providers.dart](file:///mnt/BACKUP/WORKSHOP/Personal/Projects/Jatayat/repo/jatayat/lib/core/di/data_source_providers.dart)
* Register `bookmarksLocalDataSourceProvider`.

#### [MODIFY] [repository_providers.dart](file:///mnt/BACKUP/WORKSHOP/Personal/Projects/Jatayat/repo/jatayat/lib/core/di/repository_providers.dart)
* Register `bookmarksRepositoryProvider`.

#### [MODIFY] [usecase_providers.dart](file:///mnt/BACKUP/WORKSHOP/Personal/Projects/Jatayat/repo/jatayat/lib/core/di/usecase_providers.dart)
* Register:
  * `getBookmarksUseCaseProvider`
  * `addRouteBookmarkUseCaseProvider`
  * `addFareBookmarkUseCaseProvider`
  * `removeBookmarkUseCaseProvider`
  * `isBookmarkedUseCaseProvider`

---

### 5. Presentation Layer (Refactoring Providers)

#### [MODIFY] [bookmarks_provider.dart](file:///mnt/BACKUP/WORKSHOP/Personal/Projects/Jatayat/repo/jatayat/lib/features/bookmarks/presentation/providers/bookmarks_provider.dart)
* Clean up definitions of `BookmarkItem` and direct dependency on `LocalDatabase`.
* Wire up `BookmarksNotifier` to execute the respective Use Cases injected from Riverpod!

---

## Verification Plan

### Automated Tests
* Run `flutter analyze` to ensure code is clean and compilation succeeds.
