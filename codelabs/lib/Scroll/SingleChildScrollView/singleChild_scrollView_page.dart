import 'package:flutter/material.dart';

class SingleChildScrollViewPage extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      String str = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
      return Scaffold(
        appBar: AppBar(
          title: Text('SingleChildScrollView'),
        ),
        body: Scrollbar(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Center(              
              child: Column(
                // 动态创建一个List<Widget>
                children: str.split("")
                  .map((c) => Text(c, textScaleFactor: 2.0))
                  .toList(),
              ),
            ),
          ),
        ),
      );
    }
}