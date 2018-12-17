import 'package:flutter/material.dart';

/**
 * Container
 * 
 * 本身不对应具体的RenderObject，它是DecoratedBox、ConstrainedBox、Transform、Padding、Align等widget的一个组合widget。
 * 所以我们只需通过一个Container可以实现同时需要装饰、变换、限制的场景。
 * 
  this.alignment,
  this.padding, //容器内补白，属于decoration的装饰范围
  Color color, // 背景色
  Decoration decoration, // 背景装饰
  Decoration foregroundDecoration, //前景装饰
  double width,//容器的宽度
  double height, //容器的高度
  BoxConstraints constraints, //容器大小的限制条件
  this.margin,//容器外补白，不属于decoration的装饰范围
  this.transform, //变换
  this.child,
 *
 * 容器的大小可以通过width、height属性来指定，也可以通过constraints来指定，如果同时存在时，width、height优先。实际上Container内部会根据width、height来生成一个constraints。
 * color和decoration是互斥的，实际上，当指定color时，Container内会自动创建一个decoration。
 * Container内margin和padding都是通过Padding widget来实现的
 */
class ContainerPage extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Container'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 50.0), // 容器外补白
              constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0), // 卡片大小
              decoration: BoxDecoration( // 背景装饰
                gradient: RadialGradient( // 背景径向渐变
                  colors: [Colors.red, Colors.orange],
                  center: Alignment.topRight,
                  radius: .98 // [0, 1]
                ),
                boxShadow: [ // 卡片阴影
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 4.0
                  )
                ]
              ),
              transform: Matrix4.rotationZ(.2), // 卡片倾斜变换
              alignment: Alignment.center, // 卡片内文字居中
              child: Text( // 卡片文字 
                'LXF',
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
            ),
            Divider(),

          ],
        ),
      );
    }
}