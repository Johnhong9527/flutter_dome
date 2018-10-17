import 'package:flutter/material.dart';

class DynamicPage extends StatelessWidget {
  final userName;
  DynamicPage(this.userName);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DynamicPage')),
      body: Center(child: Text('登录成功,欢迎新用户:$userName')),
    );
  }
}
