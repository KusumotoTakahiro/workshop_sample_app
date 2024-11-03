import 'package:flutter/material.dart';
import 'package:workshop_sample_app/models/room.dart';
import 'package:workshop_sample_app/services/room.dart';

class RoomProvider with ChangeNotifier {
  List<Room> _rooms = [];
  bool _isLoading = false;

  List<Room> get rooms => _rooms;
  bool get isLoading => _isLoading;

  // データを非同期で取得するメソッド
  Future<void> fetchRoomsProvider() async {
    _isLoading = true;
    notifyListeners();

    try {
      _rooms = await fetchRooms();
    } catch (error) {
      print("Failed to fetch rooms: ${error}");
    }

    _isLoading = false;
    notifyListeners();
  }
}
