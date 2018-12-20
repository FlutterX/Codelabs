import 'package:flutter/material.dart';

// TurnBox
class TurnBox extends StatefulWidget {
  const TurnBox(
      {Key key,
      this.turns = .0, // 旋转的"圈"数，一圈为360度，如0.25圈就是90度
      this.speed = 200, // 过渡动画执行的总时长
      this.child})
      : super(key: key);

  final double turns;
  final int speed;
  final Widget child;

  @override
  _TurnBoxState createState() => _TurnBoxState();
}

class _TurnBoxState extends State<TurnBox> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, lowerBound: -double.infinity, upperBound: double.infinity);
    _controller.value = widget.turns;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: widget.child,
    );
  }

  @override
  void didUpdateWidget(TurnBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 旋转角度发生变化时执行过渡动画
    if (oldWidget.turns != widget.turns) {
      _controller.animateTo(
        widget.turns,
        duration: Duration(milliseconds: widget.speed ?? 200),
        curve: Curves.easeOut,
      );
    }
  }
}

// Route
class TurnBoxPage extends StatefulWidget {
  @override
  _TurnBoxPageState createState() => _TurnBoxPageState();
}

class _TurnBoxPageState extends State<TurnBoxPage> {
  double _turns = .0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TurnBox"),
      ),
      body: Column(
        children: <Widget>[
          TurnBox(
            turns: _turns,
            speed: 500,
            child: Icon(Icons.refresh, size: 50),
          ),
          TurnBox(
            turns: _turns,
            speed: 1000,
            child: Icon(Icons.refresh, size: 150.0),
          ),
          RaisedButton(
            child: Text('顺时针旋转1/5圈'),
            onPressed: () {
              setState(() {
                _turns += .2;
              });
            },
          ),
          RaisedButton(
            child: Text('逆时针旋转1/5圈'),
            onPressed: () {
              setState(() {
                _turns -= .2;
              });
            },
          ),
        ],
      ),
    );
  }
}
