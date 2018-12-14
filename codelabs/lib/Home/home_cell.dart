import 'package:flutter/material.dart';

class HomeCell extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
          child: new Row(
            children: <Widget>[
              new Text(
                'TextField',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight:
                    FontWeight.bold
                ),)
            ],
          ),
          padding: const EdgeInsets.all(8.0),
          height: 50.0,
        ),
        new Divider(
          height: 1.0,
        )
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}