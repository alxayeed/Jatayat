import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/fare_finder/domain/repository/fare_repository.dart';
// Updated import

// Imports for Fare Finder
import '../../features/fare_finder/data/repositories/fare_repository_impl.dart';
import 'data_source_providers.dart';

// ==========================================
// FEATURE: FARE FINDER
// ==========================================

final fareRepositoryProvider = Provider<FareRepository>((ref) {
  final remoteDataSource = ref.watch(fareRemoteDataSourceProvider);
  return FareRepositoryImpl(remoteDataSource: remoteDataSource);
});

// ==========================================
// FEATURE: ROUTE EXPLORER (Coming Soon)
// ==========================================