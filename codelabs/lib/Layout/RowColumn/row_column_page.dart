import 'package:flutter/material.dart';

/**
 * textDirection：表示水平方向子widget的布局顺序(是从左往右还是从右往左)，默认为系统当前Locale环境的文本方向(如中文、英语都是从左往右，而阿拉伯语是从右往左)
 * mainAxisSize: 默认为 MainAxisSize.max
 * verticalDirection：表示Row纵轴（垂直）的对齐方向，默认是VerticalDirection.down，表示从上到下
 */

class RowColumnPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Row'),
      ),
      body: _RowColumn(),
      // body: _NestColumn(),
    );
  }
}

// 常规
class _RowColumn extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return Column(
        // 测试Row对齐方式，排除Column默认居中对齐的干扰
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 如果子widget超出屏幕范围，则会报溢出错误
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text('hello world'), Text('I am LXF1')],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text('hello world'), Text('I am LXF2')],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            textDirection: TextDirection.rtl,
            children: <Widget>[Text('hello world'), Text('I am LXF3')],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Text('hello world', style: TextStyle(fontSize: 30.0)),
              Text('I am LXF4')
            ],
          )
        ],
      );
    }
}

// 嵌套
/**
 * 如果Row里面嵌套Row，或者Column里面再嵌套Column
 * 那么只有对最外面的Row或Column会占用尽可能大的空间
 * 里面Row或Column所占用的空间为实际大小
 */
class _NestColumn extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return Container(
        color: Colors.lightBlue,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max, // 有效，外层Colum高度为整个屏幕
            children: <Widget>[
              Container(
                color: Colors.red,
                child: Column(
                  mainAxisSize: MainAxisSize.max, // 无效，内层Colum高度为实际高度  
                  children: <Widget>[
                    Text('hello world'),
                    Text('I am LXF')
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
}
