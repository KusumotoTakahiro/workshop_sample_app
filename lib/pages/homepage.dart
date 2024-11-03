import 'package:flutter/material.dart';
import 'package:workshop_sample_app/providers/room.dart';
import 'package:provider/provider.dart';
import 'package:workshop_sample_app/ui/roomList.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<RoomProvider>(context, listen: false).fetchRoomsProvider();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Consumer<RoomProvider>(
            builder: (context, provider, child) {
              // データが取得できていない間
              if (provider.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              // データが取得出来た時
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
                return Center(
                  child: Column(
                    children: [
                      const Text('掲示板 for Android'),
                      RoomList(rooms: provider.rooms),
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
