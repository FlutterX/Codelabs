import 'package:flutter/material.dart';

class GridViewPage extends StatelessWidget {
  final widgets = <Widget>[
    Icon(Icons.ac_unit),
    Icon(Icons.airport_shuttle),
    Icon(Icons.all_inclusive),
    Icon(Icons.beach_access),
    Icon(Icons.cake),
    Icon(Icons.free_breakfast)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView'),
      ),
      // body: _FixedCrossAxisCountGridView(widgets),
      // body: _CountGridView(widgets),
      // body: _MaxCrossAxisExtentGridView(widgets),
      // body: _ExtentGridView(widgets),
      body: InfiniteGridView(),
    );
  }
}

/**
 * SliverGridDelegateWithFixedCrossAxisCount
 * 
 * crossAxisCount：纵轴子元素的数量。此属性值确定后子元素在纵轴的长度就确定了,即ViewPort纵轴长度/crossAxisCount。
 * mainAxisSpacing：主轴方向的间距。
 * crossAxisSpacing：纵轴方向子元素的间距。
 * childAspectRatio：子元素在纵轴长度和主轴长度的比例。由于crossAxisCount指定后子元素纵轴长度就确定了，然后通过此参数值就可以确定子元素在主轴的长度。
 */
class _FixedCrossAxisCountGridView extends StatelessWidget {
  final List<Widget> widgets;
  _FixedCrossAxisCountGridView(this.widgets);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 纵轴三个子widget
          childAspectRatio: 1.0 // 宽高比为1
          ),
      children: widgets,
    );
  }
}

class _CountGridView extends StatelessWidget {
  final List<Widget> widgets;
  _CountGridView(this.widgets);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 1.0,
      children: widgets,
    );
  }
}

/**
 * SliverGridDelegateWithMaxCrossAxisExtent
 * 
 * - maxCrossAxisExtent为子元素在纵轴上的最大长度，之所以是“最大”长度，是因为纵轴方向每个子元素的长度仍然是等分的，
 *    举个例子，如果ViewPort的纵轴长度是450，那么当maxCrossAxisExtent的值在区间(450/4，450/3]内的话，
 *    子元素最终实际长度都为150
 * - 而childAspectRatio所指的子元素纵轴和主轴的长度比为最终的长度比。
 */
class _MaxCrossAxisExtentGridView extends StatelessWidget {
  final List<Widget> widgets;
  _MaxCrossAxisExtentGridView(this.widgets);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 120.0, childAspectRatio: 2.0 // 宽高比为2
          ),
      children: widgets,
    );
  }
}

class _ExtentGridView extends StatelessWidget {
  final List<Widget> widgets;
  _ExtentGridView(this.widgets);

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 120.0,
      childAspectRatio: 2.0,
      children: widgets,
    );
  }
}

/**
 * GridView.builder
 * 
 * 动态创建子 widget
 */
class InfiniteGridView extends StatefulWidget {
  @override
  _InfiniteGridViewState createState() => _InfiniteGridViewState();
}

class _InfiniteGridViewState extends State<InfiniteGridView> {
  List<IconData> _icons = []; // 保存Icon数据

  @override
  void initState() {
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 每行三列
          childAspectRatio: 1.0 // 显示区域宽高相等
          ),
      itemCount: _icons.length,
      itemBuilder: (context, index) {
        // 如果显示到最后一个并且Icon总数小于200时继续获取数据
        if (index == _icons.length - 1 && _icons.length < 200) {
          _retrieveIcons();
        }
        return Icon(_icons[index]);
      },
    );
  }

  // 模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }
}
