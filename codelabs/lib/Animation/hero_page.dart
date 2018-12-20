import 'package:flutter/material.dart';

class HeroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Text('点击图片'),
            ),
            
            InkWell(
              child: Hero(
                tag: 'avatar', // 唯一标记，前后两个路由页Hero的tag必须相同
                child: ClipOval(
                  child: Image.asset('images/lxf_bg.jpg', width: 50.0),
                ),
              ),
              onTap: () {
                // 打开B路由
                Navigator.push(context, PageRouteBuilder(pageBuilder:
                    (BuildContext context, Animation animation,
                        Animation secondaryAnimation) {
                  return new FadeTransition(
                    opacity: animation,
                    child: Scaffold(
                      body: _HeroAnimationRoute(),
                    ),
                  );
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}

class _HeroAnimationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HeroAnimationRoute'),
      ),
      body: Center(
        child: Hero(
          tag: 'avatar', // 唯一标记，前后两个路由页Hero的tag必须相同
          child: Image.asset('images/lxf_bg.jpg'),
        ),
      ),
    );
  }
}
