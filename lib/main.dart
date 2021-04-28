import 'package:doctors_list_screen/ui/test.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Choice {
  final String title;
  final String image;

  Choice(this.title, this.image);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabBarControllerWidget(),
      theme: ThemeData(fontFamily: 'Co'),
    );
  }
}
