
import '../models/bus_route_model/bus_route_model.dart';

abstract class RouteDataSource {
  /// Fetches all active routes
  Future<List<BusRouteModel>> getAllRoutes();

  /// Search routes by code or name
  Future<List<BusRouteModel>> searchRoutes(String query);

  /// Deep fetch for a specific route (Returns full model WITH stops list)
  Future<BusRouteModel> getRouteDetails(String routeId);
}