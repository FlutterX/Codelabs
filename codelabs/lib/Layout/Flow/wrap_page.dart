import 'package:flutter/material.dart';

// 流式布局: 我们把超出屏幕显示范围会自动折行的布局称为流式布局

/**
 * Wrap
 * 
 * spacing：主轴方向子widget的间距
 * runSpacing：纵轴方向的间距
 * runAlignment：纵轴方向的对齐方式
 */

class WrapPage extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Wrap'),
        ),
        body: Wrap(
          spacing: 8.0, // 主轴方向间距
          runSpacing: 4.0, // 纵轴方向间距
          alignment: WrapAlignment.center, // 沿主轴方向居中
          children: <Widget>[
            new Chip(
              avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
              label: new Text('Hamilton'),
            ),
            new Chip(
              avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
              label: new Text('Lafayette'),
            ),
            new Chip(
              avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
              label: new Text('Mulligan'),
            ),
            new Chip(
              avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
              label: new Text('Laurens'),
            )
          ],
        ),
      );
    }
}