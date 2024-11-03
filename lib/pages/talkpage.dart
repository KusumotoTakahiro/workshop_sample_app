import 'package:flutter/material.dart';
import 'package:workshop_sample_app/ui/commentList.dart';
import 'package:workshop_sample_app/ui/inputField.dart';

class TalkPage extends StatefulWidget {
  final String roomid;
  const TalkPage({
    super.key,
    required this.roomid,
  });

  @override
  _TalkPageState createState() => _TalkPageState();
}

class _TalkPageState extends State<TalkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 650) {
        return const Center(
          child: Column(
            children: [
              Text('トークルーム for PC'),
              // ココにルーム一覧を書いていきましょう
            ],
          ),
        );
      } else {
        return Center(
          child: Column(
            children: [
              const Text('トークルーム for Android'),
              Text('このルームは${widget.roomid}です'),
              Expanded(child: CommentList()),
              InputField(),
            ],
          ),
        );
      }
    }));
  }
}
