import 'package:flutter/material.dart';

class PaddingPage extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Padding'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            // 显示指定对齐方式为左对齐，排除对齐干扰
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                // 左边添加8像素补白
                padding: const EdgeInsets.only(left: 8.0),
                child: Text('Hello world'),
              ),
              Padding(
                // 上下各添加8像素补白
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('I am LXF'),
              ),
              Padding(
                // 分别指定四个方向的补白
                padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0),
                child: Text('A iOS developer'),
              )
            ],
          ),
        ),
      );
    }
}