import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Morfey',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Morfey'),
        ),
        body: Center(
          child: Text('Сборка прошла успешно!'),
        ),
      ),
    );
  }
}
