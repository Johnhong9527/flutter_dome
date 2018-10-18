import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:xml/xml.dart' as xml;
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;

//import 'dart:developer';
/*Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/config.json');
}

void _loadJson() {
  loadAsset().then((value) {
    JsonDecoder decoder = new JsonDecoder();
    List<List<String>> json = decoder.convert(value);
    print('姓名：' + json[0][0] + '，年龄：' + json[0][1]);
  });
}
print(_loadJson());*/

/*void someFunction(double offset) {
  debugger(when: offset > 30.0);
  // ...
}*/
Future<http.Response> fetchPost() {
  return http.get('config/recipes.json');
}

class MyTabbedPage extends StatefulWidget {
  const MyTabbedPage({Key key}) : super(key: key);

  @override
  _MyTabbedPageState createState() => new _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    new Tab(text: '原料'),
    new Tab(text: '材料'),
    new Tab(text: '工具'),
    new Tab(text: '武器'),
    new Tab(text: '装饰'),
    new Tab(text: '烹饪'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

//
  Widget _item() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          image_on_tap('images/bg.jpg'),
          image_on_tap('images/2.jpeg'),
          image_on_tap('images/4.jpeg'),
        ],
      ),
    );
  }

  // 图片点击事件
  Widget image_on_tap(image_path) {
    return GestureDetector(
      onTap: () {
        print({
          'image_path': image_path,
          'image_path2': image_path,
        });
      },
      child: Image.asset(
        image_path,
        width: 100.0,
        height: 100.0,
      ),
    );
  }

  // 子组件List数据填充
  __itemList(number) {
    GestureDetector(onTap: () {
      print(number);
    });
    var item = <Widget>[];
    for (int i = 0; i < 20; i++) {
      item.add(_item());
    }
    return item;
  }

  // 子组件List数据装载
  Widget _items(number) {
    return Container(
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.all(1.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Container(
                    child: Column(
                      children: __itemList(number),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 文字list渲染
  _textListView() {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemExtent: 20.0,
        itemBuilder: (BuildContext context, int index) {
          return Text('entry $index');
        },
      ),
    );
  }

  // 颜色List横排渲染
  _colorListView() {
    return Container(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          new Container(
            width: 160.0,
            color: Colors.red,
          ),
          new Container(
            width: 160.0,
            color: Colors.blue,
          ),
          new Container(
            width: 160.0,
            color: Colors.green,
          ),
          new Container(
            width: 160.0,
            color: Colors.yellow,
          ),
          new Container(
            width: 160.0,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }

  // TabBar头部
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('合成表'),
        bottom: new TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          _items(1),
          _items(2),
          _items(3),
          _items(4),
          _items(5),
          _items(6),
          _items(7),
        ],
      ),
    );
  }
}
