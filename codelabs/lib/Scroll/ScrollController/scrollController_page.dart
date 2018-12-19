import 'package:flutter/material.dart';

class ScrollControllerPage extends StatefulWidget {
  @override
  _ScrollControllerPageState createState() => _ScrollControllerPageState();
}

class _ScrollControllerPageState extends State<ScrollControllerPage> {
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false; // 是否显示 "返回到顶部" 按钮

  @override
  void initState() {
    // 监听滚动事件，打印滚动位置
    _controller.addListener(() {
      print(_controller.offset); // 打印滚动位置
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
    void dispose() {
      // 避免内存泄漏
      _controller.dispose();
      super.dispose();
    }

    @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(title: Text('滚动控制')),
          body: Scrollbar(
            child: ListView.builder(
              itemCount: 100,
              itemExtent: 50.0, // 显示指定高度，性能消耗小
              controller: _controller,
              itemBuilder: (context, index) {
                return ListTile(title: Text('$index'));
              },
            ),
          ),
          floatingActionButton: !showToTopBtn ? null : FloatingActionButton(
            child: Icon(Icons.arrow_upward),
            onPressed: () {
              // 返回到顶部时执行动画
              _controller.animateTo(.0,
                duration: Duration(milliseconds: 200),
                curve: Curves.ease
              );
            },
          ),
        );
      }
}
