import 'package:flutter/material.dart';
import 'Home/home_page.dart';
import 'package:codelabs/Router/router_define_handler.dart';

void main() => runApp(LXFApp());

class LXFApp extends StatelessWidget {
  final titles = ["TextField"];
  
  @override
  Widget build(BuildContext context) {
    // 初始化路由
    RouterDefineHandler.init();

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
