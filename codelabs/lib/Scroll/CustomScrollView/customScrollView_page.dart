import 'package:flutter/material.dart';

/**
 * CustomScrollView
 * 
 * 顶部需要一个GridView，底部需要一个ListView，且要求整个页面的滑动效果是统一一致的，这时可以用CustomScrollView
 * CustomScrollView的功能就相当于“胶水”,把一个个独立的可滚动widget（Sliver）"粘"起来
 * 这些Sliver共用CustomScrollView的Scrollable，最终实现统一的滑动效果
 */
class CustomScrollViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          // AppBar, 包含一个导航栏
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('LinXunFeng'),
              background: Image.asset(
                'images/lxf_bg.jpg',
                fit: BoxFit.cover
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: new SliverGrid(
              // Grid
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Grid按两列显示
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: new SliverChildBuilderDelegate((context, index) {
                // 创建子widget
                return new Container(
                  alignment: Alignment.center,
                  color: Colors.cyan[100 * (index % 9)],
                  child: new Text('grid item $index'),
                );
              }, childCount: 20),
            ),
          ),
          // List
          new SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: new SliverChildBuilderDelegate((context, index) {
              // 创建列表项
              return new Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: new Text('list item $index'),
              );
            }, childCount: 50 // 50个列表项
            ),
          ),
        ],
      ),
    );
  }
}
