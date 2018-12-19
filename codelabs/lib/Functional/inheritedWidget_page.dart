import 'package:flutter/material.dart';

/**
 * InheritedWidget
 * 
 * InheritedWidget是Flutter中非常重要的一个功能型Widget，它可以高效的将数据在Widget树中向下传递、共享
 * 能实现组件跨级传递数据
 * InheritedWidget在Widget树中数据传递方向是从上到下的，这和Notification的传递方向正好相反
 */
class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({@required this.data, Widget child}) : super(child: child);

  int data; // 需要在子树中共享的数据，保存点击次数

  // 定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
  }

  // 该回调决定当data发生变化时，是否通知子树中依赖data的Widget
  @override
  bool updateShouldNotify(ShareDataWidget old) {
    // 如果返回true，则子树中依赖(build函数中有调用)本widget的子widget的
    // state.didChangeDependencies 会被调用
    print("old.data -- ${old.data != data}");
    return old.data != data;
  }
}

class _TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    // 如果_TestWidget的build方法中没有使用ShareDataWidget的数据，
    // 那么它的didChangeDependencies()将不会被调用，因为它并没有依赖ShareDataWidget。
    return Text(
      ShareDataWidget.of(context).data.toString()
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    // 如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print('Dependencies change');
  }
}

class InheritedWidgetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InheritedWidgetPageState();
}

class _InheritedWidgetPageState extends State<InheritedWidgetPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InheritedWidget 数据共享"),
      ),
      body: Center(
        child: ShareDataWidget( // 使用ShareDataWidget
          data: count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: _TestWidget(), // 子widget中依赖ShareDataWidget
              ),
              RaisedButton(
                child: Text('Increment'),
                // 每点击一次，将count自增，然后重新build,ShareDataWidget的data将被更新
                onPressed: () => setState(() => ++count),
              )
            ],
          ),
        ),
      ),
    );
  }
}
