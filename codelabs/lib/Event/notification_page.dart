import 'package:flutter/material.dart';

/**
 * Notification
 * 
 * 在Widget树中，每一个节点都可以分发通知，通知会沿着当前节点（context）向上传递，
 * 所有父节点都可以通过NotificationListener来监听通知，
 * Flutter中称这种通知由子向父的传递为“通知冒泡”（Notification Bubbling），
 * 这个和用户触摸事件冒泡是相似的，但有一点不同：通知冒泡可以中止，但用户触摸事件不行。
 */
class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
      ),
      // body: NotificationListener(
      //   onNotification: (notification) {
      //     // print(notification);
      //     switch (notification.runtimeType) {
      //       case ScrollStartNotification:
      //         print('开始滚动');
      //         break;
      //       case ScrollUpdateNotification:
      //         print('正在滚动');
      //         break;
      //       case ScrollEndNotification:
      //         print('滚动停止');
      //         break;
      //       case OverscrollNotification:
      //         print('滚动到边界');
      //         break;
      //     }
      //   },
      //   child: ListView.builder(
      //     itemCount: 100,
      //     itemBuilder: (context, index) {
      //       return ListTile(
      //         title: Text('$index'),
      //       );
      //     },
      //   ),
      // ),
      body: _MyNotificationPage(),
    );
  }
}

// 自定义通知
class MyNotification extends Notification {
  MyNotification(this.msg);
  final String msg;
}

class _MyNotificationPage extends StatefulWidget {
  @override
  _MyNotificationPageState createState() => _MyNotificationPageState();
}

class _MyNotificationPageState extends State<_MyNotificationPage> {
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    // 监听通知
    return NotificationListener<MyNotification>(
      onNotification: (notification) {
        setState(() {
          _msg += notification.msg + " ";
        });
      },
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // RaisedButton(
            //   onPressed: () => MyNotification("Hi").dispatch(context),
            //   child: Text("Send Notification"),
            // ),
            
            /**
             * 代码中注释的部分是不能正常工作的，因为这个context是根Context，
             * 而NotificationListener是监听的子树，
             * 所以我们通过Builder来构建RaisedButton，来获得按钮位置的context。
             */
            Builder(
              builder: (context) {
                return RaisedButton(
                  onPressed: () => MyNotification("Hi").dispatch(context),
                  child: Text("Send Notification"),
                );
              },
            ),
            Text(_msg)
          ],
        ),
      ),
    );
  }
}
