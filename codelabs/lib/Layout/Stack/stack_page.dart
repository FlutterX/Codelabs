import 'package:flutter/material.dart';

/**
 * Stack
 * 
 * alignment：此参数决定如何去对齐没有定位（没有使用Positioned）或部分定位的子widget。所谓部分定位，在这里特指没有在某一个轴上定位：left、right为横轴，top、bottom为纵轴，只要包含某个轴上的一个定位属性就算在该轴上有定位。
 * textDirection：和Row、Wrap的textDirection功能一样，都用于决定alignment对齐的参考系即：textDirection的值为TextDirection.ltr，则alignment的start代表左，end代表右；textDirection的值为TextDirection.rtl，则alignment的start代表右，end代表左。
 * fit：此参数用于决定没有定位的子widget如何去适应Stack的大小。StackFit.loose表示使用子widget的大小，StackFit.expand表示扩伸到Stack的大小。
 * overflow：此属性决定如何显示超出Stack显示空间的子widget，值为Overflow.clip时，超出部分会被剪裁（隐藏），值为Overflow.visible 时则不会。
 */
class StackPage extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Stack'),
        ),
        // 通过ConstrainedBox来确保Stack占满屏幕
        body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            alignment: Alignment.center, // 指定未定位或部分定位widget的对齐方式
            fit: StackFit.expand, // 未定位widget占满Stack整个空间
            children: <Widget>[
              Container(
                child: Text('Hello World', style: TextStyle(color: Colors.white)),
                color: Colors.red,
              ),
              Positioned(
                left: 18.0,
                child: Text('I am LXF'),
              ),
              Positioned(
                top: 18.0,
                child: Text('iOS developer'),
              )
            ],
          ),
        ),
      );
    }
}