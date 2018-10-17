import 'package:flutter/material.dart';
import 'package:app/route/Page2.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    routes: <String, WidgetBuilder>{
      '/page2': (BuildContext context) => Page2("I am from Page1"),
    },
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("page1")),
      body: Center(
          child: RaisedButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/page2");
        },
        child: Text("点击我跳转"),
        color: Colors.blue,
        highlightColor: Colors.lightBlue,
      )),
    );
  }
}
