import 'package:flutter/material.dart';
import 'package:workshop_sample_app/pages/talkpage.dart';

class RoomList extends StatefulWidget {
  const RoomList({super.key});

  @override
  _RoomListState createState() => _RoomListState();
}

class _RoomListState extends State<RoomList> {
  final List<Map<String, dynamic>> rooms = [
    {'name': '雑談ルーム１', 'description': '雑談ルームの説明が，ここに入ります．', 'uuid': '1'},
    {'name': '雑談ルーム２', 'description': '雑談ルームの説明が，ここに入ります．', 'uuid': '2'},
    {'name': '雑談ルーム３', 'description': '雑談ルームの説明が，ここに入ります．', 'uuid': '3'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: SizedBox(
        height: 600, // 必要に応じて高さを指定
        child: ListView.builder(
          itemCount: rooms.length,
          itemBuilder: (context, index) {
            return Card(
              key: ValueKey(rooms[index]['uuid']),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return TalkPage(roomid: rooms[index]['uuid']);
                    }),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(rooms[index]['name']),
                    Text(rooms[index]['description'])
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
