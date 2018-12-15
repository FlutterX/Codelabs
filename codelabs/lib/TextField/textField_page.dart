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
                Navigator.push(context, MaterialPageRoute(builder: (ctx){
                  return new TextFieldFocusPage();
                }));
              },
              child: new Text(
                'focus',
                style: new TextStyle(fontSize: 15.0, color: Colors.white),
              ))
        ],
      ),
      body: new Column(
        children: <Widget>[
          new TextField(
            autofocus: true,
            controller: _selectionController,
            decoration: InputDecoration(
                labelText: '用户名',
                hintText: '用户名或邮箱',
                prefixIcon: Icon(Icons.person)),
          ),
          new TextField(
            onChanged: (value) {
              print("onChange: $value");
            },
            decoration: InputDecoration(
                labelText: '密码',
                hintText: '您的登录密码',
                prefixIcon: Icon(Icons.lock)),
            obscureText: true, // 密文显示
          )
        ],
      ),
    );
  }
}
