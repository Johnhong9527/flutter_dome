import 'package:flutter/material.dart';
import 'package:app/route/Page2.dart';
import 'package:app/route/DynamicPage.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _userPasswordController = TextEditingController();
  void onTextClear() {
    setState(() {
      _userNameController.text = '';
      _userPasswordController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TextField'),
        ),
        body: Column(
          children: <Widget>[
            TextField(
                controller: _userNameController,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 10.0),
                    icon: Icon(Icons.perm_identity),
                    labelText: '请输入用户名',
                    helperText: '注册时填写的名字')),
            TextField(
              controller: _userPasswordController,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 10.0),
                  icon: Icon(Icons.lock),
                  labelText: '请输入密码',
                  helperText: '登录密码'),
              obscureText: true,
            ),
            Builder(builder: (BuildContext context) {
              return RaisedButton(
                onPressed: () {
                  var userName = _userNameController.text.toString();
                  var password = _userPasswordController.text.toString();
                  if (userName != password) {
                    Navigator.of(context).push(PageRouteBuilder(pageBuilder:
                        (BuildContext context, Animation<double> animation,
                            Animation<double> seconderyAnimation) {
                      return DynamicPage(userName);
                    }));
                  } else {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('登录失败,用户名密码有误'),
                    ));
                  }
                  onTextClear();
                },
                color: Colors.blue,
                highlightColor: Colors.lightBlueAccent,
                disabledColor: Colors.lightBlueAccent,
                child: Text('登录', style: TextStyle(color: Colors.white)),
              );
            })
          ],
        ));
  }
}
