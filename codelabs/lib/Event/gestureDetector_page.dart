import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class GestureDetectorPage extends StatefulWidget {
  @override
  _GestureDetectorPageState createState() => _GestureDetectorPageState();
}

class _GestureDetectorPageState extends State<GestureDetectorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GestureDetector'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("试试对下方区域执行 点击、双击、长按"),
            _TapWidget(),
            Divider(),

            Text('拖动(任意方向)'),
            _PanWidget(),
            Divider(),

            Text('缩放'),
            _ScaleWidget(),
            Divider(),
            
            Text('GestureRecognizer'),
            _GestureRecognizerWidget(),
            Divider(),
          ],
        ),
      ),
    );
  }
}

// 点击、双击、长按
class _TapWidget extends StatefulWidget {
  @override
  _TapWidgetState createState() => _TapWidgetState();
}

class _TapWidgetState extends State<_TapWidget> {
  String _operation = "No Gesture detected"; // 保存事件名
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 20.0),
        color: Colors.blue,
        width: 200.0,
        height: 100.0,
        child: Text(
          _operation,
          style: TextStyle(color: Colors.white),
        ),
      ),
      onTap: () => updateText('Tap'), // 点击
      onDoubleTap: () => updateText('DoubleTap'), // 双击
      onLongPress: () => updateText('LongPress'), // 长按
    );
  }

  void updateText(String text) {
    // 更新显示的事件名
    setState(() {
      _operation = text;
    });
  }
}

// 拖动、滑动
class _PanWidget extends StatefulWidget {
  @override
  _PanWidgetState createState() => _PanWidgetState();
}

class _PanWidgetState extends State<_PanWidget> {
  double _top = 0.0; // 距顶部的偏移
  double _left = 50.0; // 距左边的偏移
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(
                child: Text("LXF"),
              ),
              /**
               * DragDownDetails.globalPosition：当用户按下时，此属性为用户按下的位置相对于屏幕(而非父widget)原点(左上角)的偏移。
               * DragUpdateDetails.delta：当用户在屏幕上滑动时，会触发多次Update事件，delta指一次Update事件的滑动的偏移量。
               * DragEndDetails.velocity：该属性代表用户抬起手指时的滑动速度(包含x、y两个轴的），示例中并没有处理手指抬起时的速度，常见的效果是根据用户抬起手指时的速度做一个减速动画。
               */

              // 手指按下时会触发此回调
              onPanDown: (DragDownDetails e) {
                // 打印手指按下的位置(相对于屏幕)
                print('用户手指按下：${e.globalPosition}');
              },
              // 手指滑动时会触发此回调
              onPanUpdate: (DragUpdateDetails e) {
                // 用户手指滑动时，更新偏移，重新构建
                setState(() {
                  _left += e.delta.dx;
                  _top += e.delta.dy;
                });
              },
              onPanEnd: (DragEndDetails e) {
                // 打印滑动结束时在x、y轴上的速度
                print(e.velocity);
              },
              // 垂直方向拖动事件
              // onVerticalDragUpdate: (DragUpdateDetails e) {
              //   setState(() {
              //     _top += e.delta.dy;
              //   });
              // },
              // 水平方向拖动事件
              // onHorizontalDragUpdate: (DragUpdateDetails e) {
              //   setState(() {
              //     _left += e.delta.dx;
              //   });
              // },
            ),
          )
        ],
      ),
    );
  }
}

// 缩放
class _ScaleWidget extends StatefulWidget {
  @override
  _ScaleWidgetState createState() => _ScaleWidgetState();
}

class _ScaleWidgetState extends State<_ScaleWidget> {
  double _width = 200.0; // 通过修改图片宽度来达到缩放效果
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        // 指定宽度，高度自适应
        child: Image.asset('images/lxf_bg.jpg', width: _width),
        onScaleUpdate: (ScaleUpdateDetails details) {
          setState(() {
            // 缩放倍数在0.8到10倍之间
            _width = 200 * details.scale.clamp(.8, 10.0);
          });
        },
      ),
    );
  }
}

// GestureRecognizer
class _GestureRecognizerWidget extends StatefulWidget {
  @override
  _GestureRecognizerWidgetState createState() =>
      _GestureRecognizerWidgetState();
}
class _GestureRecognizerWidgetState extends State<_GestureRecognizerWidget> {
  TapGestureRecognizer _tapGesture = new TapGestureRecognizer();
  bool _toggle = false; // 变色开关

  @override
  void initState() {
    super.initState();
    _tapGesture.onTap = () {
      setState(() {
        _toggle = !_toggle;
      });
    };
  }

  @override
  void dispose() {
    // 用到GestureRecognizer就一定要调用其dispose方法释放资源
    _tapGesture.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(TextSpan(children: [
        TextSpan(text: '你好世界'),
        TextSpan(
            text: '点我变色',
            style: TextStyle(
                fontSize: 30.0, color: _toggle ? Colors.blue : Colors.red),
            recognizer: _tapGesture),
        TextSpan(text: '你好世界'),
      ])),
    );
  }
}
