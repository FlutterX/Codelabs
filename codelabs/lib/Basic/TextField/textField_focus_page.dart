import 'package:flutter/material.dart';

class TextFieldFocusPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _TextFieldFocusState();
}

class _TextFieldFocusState extends State<TextFieldFocusPage> {
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
    void initState() {
      super.initState();

      // 监听焦点变化
      focusNode1.addListener((){
        print(focusNode1.hasFocus ? '获取焦点' : '失去焦点');
      });
    }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Focus'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            new TextField(
              autofocus: true,
              focusNode: focusNode1,
              decoration: new InputDecoration(labelText: 'input1'),
            ),
            new TextField(
              focusNode: focusNode2,
              decoration: new InputDecoration(labelText: 'input2'),
            ),
            new Builder(builder: (ctx) {
              return Column(
                children: <Widget>[
                  new RaisedButton(
                    child: new Text('移动焦点'),
                    onPressed: () {
                      //将焦点从第一个TextField移到第二个TextField
                      // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                      // 这是第二种写法
                      if (null == focusScopeNode) {
                        focusScopeNode = FocusScope.of(context);
                      }
                      focusScopeNode.requestFocus(focusNode1.hasFocus ? focusNode2 : focusNode1);
                    },
                  ),
                  new RaisedButton(
                    child: new Text('隐藏键盘'),
                    onPressed: () {
                      focusNode1.unfocus();
                      focusNode2.unfocus();
                    },
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
