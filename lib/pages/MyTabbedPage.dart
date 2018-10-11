import 'package:flutter/material.dart';
import 'package:xml/xml.dart' as xml;

class MyTabbedPage extends StatefulWidget {
  const MyTabbedPage({Key key}) : super(key: key);

  @override
  _MyTabbedPageState createState() => new _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage> with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    new Tab(text: '材料'),
    new Tab(text: '合成'),
    new Tab(text: '工具'),
    new Tab(text: '武器'),
    new Tab(text: '居家'),
    new Tab(text: '食物'),
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
          Container(
            child: Text(
              'document',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w900,
                fontFamily: "Georgia",
              ),
            ),
            width: 320.0,
            height: 240.0,
            color: Colors.grey[300],
          ),
          Container(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemExtent: 20.0,
              itemBuilder: (BuildContext context, int index) {
                return Text('entry $index');
              },
            ),
          ),
          Container(
            child: CustomScrollView(
              shrinkWrap: true,
              slivers: <Widget>[
                SliverPadding(
                  padding: EdgeInsets.all(20.0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      <Widget>[
                        Text(
                          'I\'m dedicating every day to you',
                          style: TextStyle(fontSize: 35.0),
                        ),
                        Text('Domestic life was never quite my style'),
                        Text('When you smile, you knock me out, I fall apart'),
                        Text('And I thought I was so smart'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
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
          ),
          Text('合成表5'),
          Text('合成表6'),
        ],
      ),
    );
  }
}
