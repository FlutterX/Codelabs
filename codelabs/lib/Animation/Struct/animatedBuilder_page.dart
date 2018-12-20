import 'package:flutter/material.dart';

/**
 * AnimatedBuilder
 * 
 * 用AnimatedWidget可以从动画中分离出widget，而动画的渲染过程（即设置宽高）仍然在AnimatedWidget中，
 * 假设如果我们再添加一个widget透明度变化的动画，那么我们需要再实现一个AnimatedWidget，
 * 这样不是很优雅，如果我们能把渲染过程也抽象出来，那就会好很多，
 * 而AnimatedBuilder正是将渲染逻辑分离出来
 */
class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;
  
  @override
    Widget build(BuildContext context) {
      return new Center(
        child: new AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return new Container(
              height: animation.value,
              width: animation.value,
              child: child,
            );
          },
          child: child,
        ),
      );
    }
}



class AnimatedBuilderPage extends StatefulWidget {
  @override
    _AnimatedBuilderPageState createState() => _AnimatedBuilderPageState();
}

class _AnimatedBuilderPageState extends State<AnimatedBuilderPage>
  with SingleTickerProviderStateMixin {
  
  Animation<double> animation;
  AnimationController controller;

  @override
    void initState() {
      super.initState();
      controller = new AnimationController(
        duration: const Duration(seconds: 3),
        vsync: this
      );
      // 图片宽高从0变到300
      animation = new Tween(begin: 0.0, end: 300.0).animate(controller);
      /**
       * AnimationStatus
       * 
       * dismissed	动画在起始点停止
       * forward	动画正在正向执行
       * reverse	动画正在反向执行
       * completed	动画在终点停止
       */
      animation.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // 动画执行结束时反向执行动画
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          // 动画恢复到初始状态时执行动画（正向）
          controller.forward();
        }
      });
      // 启动动画（正向）
      controller.forward();
    }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("AnimatedBuilder"),
        ),
        body: GrowTransition(
          child: Image.asset('images/lxf_bg.jpg'),
          animation: animation,
        ),
      );
    }
}