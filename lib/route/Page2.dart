import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  final title;
  Page2(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("page2"),
      ),
      body: Center(child: Text(title, style: TextStyle(fontSize: 25.0))),
    );
  }
}
