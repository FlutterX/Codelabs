import 'package:flutter/material.dart';

/**
 * DecoratedBox
 * 
 * decoration：代表将要绘制的装饰，它类型为Decoration，Decoration是一个抽象类，它定义了一个接口 createBoxPainter()，子类的主要职责是需要通过实现它来创建一个画笔，该画笔用于绘制装饰。
 * position：此属性决定在哪里绘制Decoration，它接收DecorationPosition的枚举类型，该枚举类两个值：
 *  - background：在子widget之后绘制，即背景装饰。
 *  - foreground：在子widget之上绘制，即前景。
 */

/**
 * BoxDecoration
 * 
 * Color color, //颜色
 * DecorationImage image,//图片
 * BoxBorder border, //边框
 * BorderRadiusGeometry borderRadius, //圆角
 * List<BoxShadow> boxShadow, //阴影,可以指定多个
 * Gradient gradient, //渐变
 * BlendMode backgroundBlendMode, //背景混合模式
 * BoxShape shape = BoxShape.rectangle, //形状
 */

class DecoreatedBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DescoratedBox'),
      ),
      body: Center(
        child: DecoratedBox(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.red, Colors.orange[700]]), // 背景渐变
              borderRadius: BorderRadius.circular(3.0), // 3像素圆角
              boxShadow: [
                // 阴影
                BoxShadow(
                    color: Colors.black54,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 4.0
                )
              ]),
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }
}
