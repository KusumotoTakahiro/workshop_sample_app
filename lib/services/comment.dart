import 'package:workshop_sample_app/models/comment.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Comment>> fetchComments(String roomUuid) async {
  final response = await http.get(Uri.parse(
      'https://eagle5.fu.is.saga-u.ac.jp/workshop2024-flutter-api/comment/'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(utf8.decode(response.bodyBytes));

    // すべてのコメントを取得し、roomUuidによってフィルタリング
    return jsonResponse
        .map((data) => Comment.fromJson(data))
        .where((comment) => comment.roomUuid == roomUuid)
        .toList();
  } else {
    throw Exception('Failed to load comments');
  }
}

Future<void> addComment(String roomId, String body, String talker) async {
  print('Starting to add comment...');
  print(roomId);
  print(body);
  print(talker);
  final response = await http.post(
    Uri.parse(
        'https://eagle5.fu.is.saga-u.ac.jp/workshop2024-flutter-api/comment/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'room': roomId,
      'body': body,
      'talker': talker,
    }),
  );

  if (response.statusCode == 201) {
    print('Postリクエストは確実に動作しました');
  } else {
    throw Exception('Failed to add comment');
  }
}
