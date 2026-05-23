class BookmarkItem {
  final String id;
  final String type; // 'route' or 'fare'
  final dynamic entity; // BusRoute or FareResultEntity
  final int createdAt;

  BookmarkItem({
    required this.id,
    required this.type,
    required this.entity,
    required this.createdAt,
  });
}
