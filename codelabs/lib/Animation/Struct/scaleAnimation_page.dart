import 'package:flutter/material.dart';

class ScaleAnimationPage extends StatefulWidget {
  @override
  _ScaleAnimationPageState createState() => _ScaleAnimationPageState();
}

// 需要继承 TickerProvider, 如果有多个 AnimationController, 则应该使用 TickerProviderStateMixin.
class _ScaleAnimationPageState extends State<ScaleAnimationPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    // 使用弹性曲线
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    // 图片宽高从0变到300
    // animation = new Tween(begin: 0.0, end: 300.0).animate(controller)
    animation = new Tween(begin: 0.0, end: 300.0).animate(animation)
      ..addListener(() {
        setState(() => {});
      });
    // 启动动画(正向执行)
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: Center(
        child: Image.asset('images/lxf_bg.jpg',
          width: animation.value,
          height: animation.value,
        ),
      ),
    );
  }
  
  @override
    void dispose() {
      // 路由销毁时需要释放动画资源
      controller.dispose();
      super.dispose();
    }
}
