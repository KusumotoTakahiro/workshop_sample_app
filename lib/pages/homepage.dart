import 'package:flutter/material.dart';
import 'package:workshop_sample_app/ui/button.dart';
import 'package:workshop_sample_app/ui/roomList.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 650) {
        return const Center(
          child: Column(
            children: [
              Text('掲示板 for PC'),
              // ココにルーム一覧を書いていきましょう
            ],
          ),
        );
      } else {
        return const Center(
          child: Column(
            children: [
              Text('掲示板 for Android'),
              RoomList()
              // ココにルーム一覧を書いていきましょう
            ],
          ),
        );
      }
    }));
  }
}
