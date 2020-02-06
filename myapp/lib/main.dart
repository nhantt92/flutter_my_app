import 'package:flutter/material.dart';
import 'package:myapp/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
        home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  
  bool _showPass = false;
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  var _userInvalid = false;
  var _passInvalid = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Container(
                  width: 70,
                  height: 70,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffd8d8d8),
                  ),
                  child: FlutterLogo(),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
              child: Text('Hello\nWelcome Back',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: TextField(
                style: TextStyle(fontSize: 18, color: Colors.black),
                controller: _userController,
                decoration: InputDecoration(
                    labelText: "USERNAME",
                    errorText: _userInvalid ? "Username không hợp lệ" : null,
                    labelStyle:
                        TextStyle(color: Color(0xf8888888), fontSize: 15)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: <Widget>[
                    TextField(
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      controller: _passController,
                      obscureText: _showPass?true:false,
                      decoration: InputDecoration(
                          labelText: "PASSWORD",
                          errorText: _passInvalid ? "Password phải lớn hơn 6 ký tự" : null,
                          labelStyle: TextStyle(
                              color: Color(0xf8888888), fontSize: 15)),
                    ),
                    GestureDetector(
                      onTap: onToggleShowPass,
                      child: Text(
                        _showPass?"SHOW":"HIDE",
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                    )
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: RaisedButton(
                  onPressed: onSignInClicked,
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Text(
                    "SIGN IN",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "NEW USER? SIGNUP",
                    style: TextStyle(color: Color(0xf8888888), fontSize: 15),
                  ),
                  Text(
                    "FORGOT PASSWORD",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void onSignInClicked() {
    setState(() {
      if(_userController.text.length < 6 || !_userController.text.contains("@")) {
        _userInvalid = true;
      } else {
        _userInvalid = false;
      }
      if(_passController.text.length < 6){
        _passInvalid = true;
      } else {
        _passInvalid = false;
      }
      if(!_userInvalid && !_passInvalid){
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    });
  }
}
