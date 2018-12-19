import 'package:flutter/material.dart';
import 'home_cell.dart';
import 'package:codelabs/Router/router_define_handler.dart';

class Home extends StatelessWidget {
  final titles = [
    // Basic
    "TextField",
    "Form",
    // Layout
    "RowColumn",
    "FlexExpanded",
    "Wrap",
    "Flow",
    "Stack",
    "Padding",
    "Box",
    "DecoratedBox",
    "Transform",
    "Container",
    // Scroll
    "SingleChildScrollView",
    "ListView",
    "GridView",
    "CustomScrollView",
    "ScrollController",
    "NotificationListener",
    // Functional
    "WillPopScope",
    "InheritedWidget",
    "ThemeData",
    // Event
    "Pointer",
    "GestureDetector",
    "Event",
    "Notification"
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: titles.length,
      itemBuilder: (context, index) {
        return new FlatButton(
            child: new HomeCell(titles[index]),
            onPressed: () {
              print('select index -- $index');
              final route = RouterDefineHandler.fetchRoute(titles[index]);
              RouterDefineHandler.router.navigateTo(context, route);
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) {
              //       return new TextFieldPage();
              //     })
              // );
            });
      },
    );
  }
}
