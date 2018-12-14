import 'package:flutter/material.dart';
import 'home_cell.dart';
import 'package:codelabs/TextField/textField_page.dart';

class Home extends StatelessWidget {
  final titles = ["TextField"];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: titles.length,
      itemBuilder: (context, index) {
        return new FlatButton(
            child: new HomeCell(),
            onPressed: () {
              print('select index -- $index');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return new Scaffold(
                      appBar: AppBar(
                        title: Text(titles[index]),
                      ),
                      body: new TextFieldPage(),
                    );
                  })
              );
            });
      },
    );
  }
}