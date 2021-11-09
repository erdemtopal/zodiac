import 'package:flutter/material.dart';
import 'package:flutter_zodiac/burc_listesi.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  //debug etiketini kaldırır
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      title: 'List of Zodiac',
      home: BurcListesi(),
    );
  }
}
