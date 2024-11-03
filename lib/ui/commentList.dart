import 'package:flutter/material.dart';

class CommentList extends StatefulWidget {
  const CommentList({super.key});

  @override
  _CommentListState createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {
  final List<Map<String, dynamic>> commnets = [
    {
      'talker': 'たろう',
      'room': '1',
      'body':
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
      'created_at': '2024/11/03',
      'uuid': '1'
    },
    {
      'talker': 'たろう',
      'room': '1',
      'body': 'こんにちは',
      'created_at': '2024/11/03',
      'uuid': '2'
    },
    {
      'talker': 'じろう',
      'room': '1',
      'body': 'こんにちは',
      'created_at': '2024/11/03',
      'uuid': '3'
    },
  ];
  final String myname = 'じろう';

  Widget _buildComment({
    required String talker,
    required String body,
    required String date,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // アイコン（ユーザーのアバター）
        Column(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey.shade300,
            ),
            Text(talker)
          ],
        ),

        const SizedBox(width: 8),

        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // メッセージの吹き出し
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Text(
                  body,
                  style: const TextStyle(fontSize: 14),
                  softWrap: true,
                ),
              ),
              const SizedBox(height: 4),
              // メッセージの送信時間
              Text(
                date,
                style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: SizedBox(
        height: 600, // 必要に応じて高さを指定
        child: ListView.builder(
          itemCount: commnets.length,
          itemBuilder: (context, index) {
            return Container(
              key: ValueKey(commnets[index]['uuid']),
              child: _buildComment(
                talker: commnets[index]['talker'],
                body: commnets[index]['body'],
                date: commnets[index]['created_at'],
              ),
            );
          },
        ),
      ),
    );
  }
}
