import 'package:flutter/material.dart';
//import 'package:login_ui_app/pages/home_page.dart';
//import '../utils/animations/login_page_animation.dart';
//import '../utils/animations/page_route_fade_animation.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

//--------------------------------------------

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  double? _deviceHeight, _deviceWidth;

  AnimationController? _controller;

  //EnterAnimation? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      reverseDuration: Duration(milliseconds: 400),
    );
    // _animation = EnterAnimation(_controller!);
    _controller?.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(125, 191, 211, 1.0),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          height: _deviceHeight! * 0.60,
          width: _deviceWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: _deviceHeight! * 0.05,
              ),
              _emailFieldWidget(),
              _passwordFieldWidget(),
              SizedBox(
                height: _deviceHeight! * 0.10,
              ),
              _loginButton(context),
            ],
          ),
        ),
      ),
    );
  }

//default_profile image

  //email field
  Widget _emailFieldWidget() {
    return Container(
      width: _deviceWidth! * 0.70,
      child: const TextField(
        cursorColor: Colors.white,
        autocorrect: false,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: "ilman@gmail.com",
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }

  //create password field
  Widget _passwordFieldWidget() {
    return Container(
      width: _deviceWidth! * 0.70,
      child: const TextField(
        obscureText: true, //unseen text
        cursorColor: Colors.white,
        autocorrect: false,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: "Password",
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext _context) {
    return MaterialButton(
      minWidth: _deviceWidth! * 0.38,
      height: _deviceHeight! * 0.05,
      color: Colors.white,
      child: const Text(
        "Log In",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(125, 191, 211, 1.0),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
        side: BorderSide(color: Colors.white),
      ),
      onPressed: () async {
        await _controller!.reverse();
      },
    ); //button material
  }
}
