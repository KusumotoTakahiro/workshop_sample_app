import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshop_sample_app/models/room.dart';
import 'package:workshop_sample_app/providers/comment.dart';
import 'package:workshop_sample_app/ui/commentList.dart';
import 'package:workshop_sample_app/ui/inputField.dart';

class TalkPage extends StatefulWidget {
  final Room room;
  const TalkPage({
    super.key,
    required this.room,
  });

  @override
  _TalkPageState createState() => _TalkPageState();
}

class _TalkPageState extends State<TalkPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CommentProvider>(context, listen: false)
          .fetchCommentsProvider(widget.room.uuid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Consumer<CommentProvider>(
            builder: (context, provider, child) {
              if (provider.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

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
                      Text('このルームは『${widget.room.name}』です'),
                      Text('詳細：${widget.room.description}'),
                      Expanded(child: CommentList(comments: provider.comments)),
                      InputField(room: widget.room),
                    ],
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
