import 'package:flutter/material.dart';
import 'textField_focus_page.dart';

class TextFieldPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _selectionController = new TextEditingController();
    // 设置默认值，并从第三个字符开始选中后面的字符
    _selectionController.text = "hello world";
    _selectionController.selection = TextSelection(
        baseOffset: 2, extentOffset: _selectionController.text.length);

    return new Scaffold(
      appBar: AppBar(
        title: Text('TextField'),
        actions: <Widget>[
          new FlatButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                  return new TextFieldFocusPage();
                }));
              },
              child: new Text(
                'focus',
                style: new TextStyle(fontSize: 15.0, color: Colors.white),
              ))
        ],
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
            hintColor: Colors.yellow, // 定义下划线颜色
            inputDecorationTheme: InputDecorationTheme(
                labelStyle: TextStyle(color: Colors.green), // 定义label字体样式
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0))), // 定义提示文本样式
        child: new Column(
          children: <Widget>[
            new TextField(
              autofocus: true,
              controller: _selectionController,
              decoration: InputDecoration(
                  labelText: '用户名',
                  hintText: '用户名或邮箱',
                  prefixIcon: Icon(Icons.person),
                  // border: InputBorder.none, // 隐藏下划线
              ),
            ),
            new TextField(
              onChanged: (value) {
                print("onChange: $value");
              },
              decoration: InputDecoration(
                labelText: '密码',
                hintText: '您的登录密码',
                prefixIcon: Icon(Icons.lock),
                labelStyle: TextStyle(
                  color: Colors.cyan,
                ),
                hintStyle: TextStyle(
                  color: Colors.red,
                  fontSize: 13.0,
                ),
              ),
              obscureText: true, // 密文显示
            )
          ],
        ),
      ),
    );
  }
}

/**
 * 修改 TextField 的下划线
 * 
 * TextField 中的 下划线颜色 与 提示文本颜色 使用的都是主题色里的 hintColor。
 * 如果直接修改 hintColor，那么下划线和提示文本的颜色都会变。
 * 但是 decoration 中可以设置 hintStyle，它可以覆盖 hintColor，
 * 并且主题中可以通过 inputDecorationTheme 来设置输入框默认的 decoration
 */