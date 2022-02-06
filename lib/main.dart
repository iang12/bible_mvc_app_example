import 'package:flutter/material.dart';

import 'views/books/books_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Mvc',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Biblia'),
    );
  }
}
