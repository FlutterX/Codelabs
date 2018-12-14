import 'package:flutter/material.dart';
import 'Home/home_page.dart';

void main() => runApp(LXFApp());

class LXFApp extends StatelessWidget {
  final titles = ["TextField"];
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
     title: 'Codelabs',
     home: new Scaffold(
       appBar: new AppBar(
         title: new Text('首页'),
       ),
       body: new Home(),
     ), 
    );
  }
}
