import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshop_sample_app/models/room.dart';
import 'package:workshop_sample_app/providers/comment.dart';

class InputField extends StatefulWidget {
  final Room room;
  const InputField({super.key, required this.room});

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final String myname = 'じろう';
  final TextEditingController controller = TextEditingController();

  sendText(String text) {
    final provider = Provider.of<CommentProvider>(context, listen: false);
    if (provider == null) {
      return;
    }

    provider.addCommentProvider(widget.room.uuid, text, myname).then((_) {
      print('Comment added successfully');
    }).catchError((error) {
      print('Failed to add comment: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(0, -1),
              blurRadius: 4.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'send a message ...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                ),
              ),
            ),
            const SizedBox(width: 8.0),

            // 送信ボタン
            GestureDetector(
              onTap: () {
                if (controller.text.isNotEmpty) {
                  sendText(controller.text);
                  controller.clear();
                  // キーボード入力後キーボードを自動で閉じる処理.
                  FocusScope.of(context).unfocus();
                }
              },
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: const Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ));
  }
}
