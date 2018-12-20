import 'package:flutter/material.dart';

/**
 * AnimatedWidget
 * 
 * 通过addListener()和setState() 来更新UI这一步其实是通用的，
 * 如果每个动画中都加这么一句是比较繁琐的。
 * AnimatedWidget类封装了调用setState()的细节，并允许我们将Widget分离出来
 */
class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation})
    : super(key: key, listenable: animation);

  @override
    Widget build(BuildContext context) {
      final Animation<double> animation = listenable;
      return new Center(
        child: Image.asset('images/lxf_bg.jpg',
          width: animation.value,
          height: animation.value
        ),
      );
    }
}

class AnimatedWidgetPage extends StatefulWidget {
  @override
    _AnimatedWidgetPageState createState() => _AnimatedWidgetPageState();
}

class _AnimatedWidgetPageState extends State<AnimatedWidgetPage> 
  with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;

  @override
    void initState() {
      super.initState();
      controller = AnimationController(
        duration: const Duration(seconds: 3),
        vsync: this
      );
      // 图片宽高从0变到300
      animation = new Tween(begin: 0.0, end: 300.0).animate(controller);
      // 启动动画
      controller.forward();
    }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("AnimatedWidget"),
        ),
        body: AnimatedImage(animation: animation)
      );
    }

  @override
    void dispose() {
      controller.dispose();
      super.dispose();
    }
}