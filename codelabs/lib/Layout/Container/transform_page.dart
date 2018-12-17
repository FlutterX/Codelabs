import 'package:flutter/material.dart';
import 'dart:math' as math;

/**
 * Transform
 * 
 * Transform的变换是应用在绘制阶段，而并不是应用在布局(layout)阶段
 * 所以无论对子widget应用何种变化，其占用空间的大小和在屏幕上的位置都是固定不变的，因为这些是在布局阶段就确定的
 */
class TransformPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BoxDecoration redBoxDecoration = BoxDecoration(color: Colors.red);

    return Scaffold(
      appBar: AppBar(
        title: Text('Transform'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.black,
              child: new Transform(
                alignment: Alignment.topRight, // 相对于坐标系原点的对齐方法
                transform: new Matrix4.skewY(0.3), // 沿Y轴倾斜0.3弧度
                child: new Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.deepOrange,
                  child: const Text('Apartment for rent!'),
                ),
              ),
            ),
            Divider(),

            // 平稳
            DecoratedBox(
              decoration: redBoxDecoration,
              // 默认原点为左上角，左移20像素，向上平衡5像素
              child: Transform.translate(
                offset: Offset(-20.0, -5.0),
                child: Text('Hello world'),
              ),
            ),
            Divider(),

            // 旋转
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: DecoratedBox(
                decoration: redBoxDecoration,
                child: Transform.rotate(
                  // 旋转90度
                  angle: math.pi / 2,
                  child: Text('Hello world'),
                ),
              ),
            ),
            Divider(),

            // 缩放
            DecoratedBox(
              decoration: redBoxDecoration,
              child: Transform.scale(
                scale: 1.5, // 放大到1.5倍
                child: Text('Hello world'),
              ),
            ),
            Divider(),

            // Transform 仅应用于绘制阶段
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DecoratedBox(
                  decoration: redBoxDecoration,
                  child: Transform.scale(
                    scale: 1.5,
                    child: Text('Hello world'),
                  ),
                ),
                Text('你好', style: TextStyle(color: Colors.green, fontSize: 18.0))
              ],
            ),
            Divider(),

            /**
             * RotatedBox
             * 
             * RotatedBox 和 Transform.rotate功能相似，它们都可以对子widget进行旋转变换
             * 但是有一点不同：RotatedBox的变换是在layout阶段，会影响在子widget的位置和大小
             */
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DecoratedBox(
                  decoration: redBoxDecoration,
                  // 将Transform.rotate换成RotatedBox  
                  child: RotatedBox(
                    quarterTurns: 1, // 旋转90度（1/4圈）
                    child: Text('Hello world'),
                  ),
                ),
                Text('你好', style: TextStyle(color: Colors.green, fontSize: 18.0))
              ],
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
