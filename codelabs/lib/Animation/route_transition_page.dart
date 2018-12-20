import 'package:flutter/material.dart';
import 'package:codelabs/Basic/TextField/textField_focus_page.dart';

class RouteTransitionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('自定义路由切换动画'),
        ),
        body: Center(
          child: FlatButton(
            child: Text('DIY'),
            textColor: Colors.white,
            color: Colors.lightBlue,
            onPressed: () {
              Navigator.push(context, FadeRoute(builder: (context) {
                return TextFieldFocusPage();
              }));
            },
          ),
        ));
  }
}

class FadeRoute extends PageRoute {
  FadeRoute({@required this.builder});

  final WidgetBuilder builder;

  @override
  // TODO: implement opaque
  bool get opaque => true;

  @override
  // TODO: implement transitionDuration
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  // TODO: implement barrierDismissible
  bool get barrierDismissible => false;

  @override
  // TODO: implement barrierColor
  Color get barrierColor => null;

  @override
  // TODO: implement barrierLabel
  String get barrierLabel => null;

  @override
  // TODO: implement maintainState
  bool get maintainState => true;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: builder(context),
    );

    // // 当前路由被激活，是打开新路由
    // if (isActive) {
    //   return FadeTransition(
    //     opacity: animation,
    //     child: builder(context),
    //   );
    // } else {
    //   // 返回，则不应用过渡动画
    //   return builder(context);
    // }
  }
}
