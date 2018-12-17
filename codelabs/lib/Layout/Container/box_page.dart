import 'package:flutter/material.dart';

// SizedBox只是ConstrainedBox一个定制

/**
 * BoxConstraints
 * 
 * minWidth  //最小宽度
 * maxWidth  //最大宽度
 * minHeight //最小高度
 * maxHeight //最大高度
 * 
 * BoxConstraints.tight(Size size)，它可以生成给定大小的限制
 * const BoxConstraints.expand()可以生成一个尽可能大的用以填充另一个容器的BoxConstraints
 */

class BoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget redBox = DecoratedBox(decoration: BoxDecoration(color: Colors.red));

    return new Scaffold(
      appBar: AppBar(
        title: Text('Box'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // ConstrainedBox
          ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: double.infinity, // 宽度尽可能大
                minHeight: 50.0 // 最小高度为50像素
                ),
            child: Container(
              height: 5.0,
              child: redBox,
            ),
          ),
          Divider(),

          // 多重限制
          /**
           * 最终显示效果是宽90，高60
           * 即取父子中相应数值较大的，只有这样才能保证父限制与子限制不冲突
           */
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0), // 父
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0), // 子
              child: redBox,
            ),
          ),
          Divider(),

          // UnconstrainedBox
          /**
           * 最终显示效果是宽90，高20
           * 注：子widget在不更改父widget的代码的情况下无法彻底去除其限制条件
           */
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0), // 父
            child: UnconstrainedBox( // "去除"父级限制
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),
                child: redBox,
              ),
            ),
          )
        ],
      ),
    );
  }
}
