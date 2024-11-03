import 'package:workshop_sample_app/models/room.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Room>> fetchRooms() async {
  final response = await http.get(Uri.parse(
      'https://eagle5.fu.is.saga-u.ac.jp/workshop2024-flutter-api/room/'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(utf8.decode(response.bodyBytes));
    return jsonResponse.map((data) => Room.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load rooms');
  }
}
