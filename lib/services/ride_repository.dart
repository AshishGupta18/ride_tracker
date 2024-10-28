import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/ride.dart';

class RideRepository {
  final String apiUrl = 'http://flutter.dev.emotorad.com/get_routes';
  final String bookmarkUrl = 'http://flutter.dev.emotorad.com/bookmark_route';
  final String authHeader = ' Bearer ashish189000@gmail.com';

  Future<List<Ride>> fetchRides() async {
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {'Authorization': authHeader},
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((ride) => Ride.fromJson(ride)).toList();
    } else {
      // Log or handle specific status codes if needed
      // Print the error for debugging
      print('Failed to load rides: ${response.statusCode} ${response.body}');
      throw Exception('Failed to load rides: ${response.statusCode}');
    }
  }

  Future<void> toggleBookmark(int routeId, bool isBookmarked) async {
    final response = await http.post(
      Uri.parse(bookmarkUrl),
      headers: {'Authorization': authHeader, 'Content-Type': 'application/json'},
      body: json.encode({
        'route_id': routeId,
        'bookmark': !isBookmarked,
      }),
    );

    if (response.statusCode != 200) {
      // Log or handle specific status codes if needed
      throw Exception('Failed to toggle bookmark: ${response.statusCode}');
    }
  }
}