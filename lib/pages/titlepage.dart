import 'package:flutter/material.dart';
import 'package:workshop_sample_app/ui/button.dart';

class TitlePage extends StatefulWidget {
  const TitlePage({super.key});

  @override
  _TitlePageState createState() => _TitlePageState();
}

class _TitlePageState extends State<TitlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 650) {
        return const Center(
          child: Column(
            children: [
              Text('掲示板 for PC'),
              Button(),
            ],
          ),
        );
      } else {
        return const Center(
          child: Column(
            children: [
              Text('掲示板 for Android'),
              Button(),
            ],
          ),
        );
      }
    }));
  }
}
