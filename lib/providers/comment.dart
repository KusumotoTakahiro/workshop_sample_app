import 'package:flutter/material.dart';
import 'package:workshop_sample_app/models/comment.dart';
import 'package:workshop_sample_app/services/comment.dart';

class CommentProvider extends ChangeNotifier {
  List<Comment> _comments = [];
  bool _isLoading = false;

  List<Comment> get comments => _comments;
  bool get isLoading => _isLoading;

  Future<void> fetchCommentsProvider(String roomId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _comments = await fetchComments(roomId); // roomIdを渡してフィルタリング
    } catch (error) {
      print(error);
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> addCommentProvider(
      String roomUuid, String body, String talker) async {
    try {
      await addComment(roomUuid, body, talker);
      await fetchComments(roomUuid);
    } catch (error) {
      print(error);
    }
  }
}
