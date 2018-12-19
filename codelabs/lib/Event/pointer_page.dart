import 'package:flutter/material.dart';

/**
 * Listener
 * 
 * Key key,
 * this.onPointerDown, //手指按下回调
 * this.onPointerMove, //手指移动回调
 * this.onPointerUp,//手指抬起回调
 * this.onPointerCancel,//触摸事件取消回调
 * this.behavior = HitTestBehavior.deferToChild, //在命中测试期间如何表现
 * Widget child
 */

/**
 * PointerXXXEvent
 * 
 * position：它是鼠标相对于当对于全局坐标的偏移。
 * delta：两次指针移动事件（PointerMoveEvent）的距离。
 * pressure：按压力度，如果手机屏幕支持压力传感器(如iPhone的3D Touch)，此属性会更有意义，如果手机不支持，则始终为1。
 * orientation：指针移动方向，是一个角度值。
 */

class PointerPage extends StatefulWidget {
  @override
  _PointerPageState createState() => _PointerPageState();
}

class _PointerPageState extends State<PointerPage> {
  // 定义一个状态，保存当前指针位置
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pointer'),
      ),
      body: Column(
        children: <Widget>[
          Listener(
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              width: 300.0,
              height: 150.0,
              child: Text(
                _event?.toString() ?? "",
                style: TextStyle(color: Colors.white),
              ),
            ),
            onPointerDown: (PointerDownEvent event) =>
                setState(() => _event = event),
            onPointerMove: (PointerMoveEvent event) =>
                setState(() => _event = event),
            onPointerUp: (PointerUpEvent event) =>
                setState(() => _event = event),
          ),
          Divider(),
          
          /**
           * 忽略PointerEvent
           * 
           * 不想让某个子树响应PointerEvent的话，我们可以使用IgnorePointer和AbsorbPointer，
           * 这两个Widget都能阻止子树接收指针事件，
           * 不同之处在于AbsorbPointer本身会参与命中测试，而IgnorePointer本身不会参与，
           * 这就意味着AbsorbPointer本身是可以接收指针事件的(但其子树不行)，而IgnorePointer不可以。
           */
          Listener(
            child: AbsorbPointer(
              child: Listener(
                child: Container(
                  color: Colors.red,
                  width: 200.0,
                  height: 100.0,
                ),
                onPointerDown: (event) => print('in'),
              ),
            ),
            onPointerDown: (event) => print('up'),
          )
        ],
      ),
    );
  }
}
