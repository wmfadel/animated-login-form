import 'package:flutter/material.dart';
import '../widgets/form_box.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation1, animation2, animation3;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    animation1 = Tween(begin: -1.0, end: 0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.bounceInOut));

    animation2 = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(.50, 1.0, curve: Curves.fastOutSlowIn)));

    animation3 = Tween(begin: 1.0, end: 0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(.8, 1.0, curve: Curves.fastOutSlowIn)));
  }

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;
    animationController.forward();
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            body: ListView(
              shrinkWrap: true,
              children: <Widget>[
                SizedBox(height: _height * 0.15),
                Transform(
                  transform: Matrix4.translationValues(
                      0, animation2.value * _height, 0),
                  child: Text(
                    'Welcome back',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF36BA7A),
                      fontSize: 20,
                      fontFamily: 'Quicksand',
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Transform(
                  transform: Matrix4.translationValues(
                      animation1.value * _width, 0, 0),
                  child: Container(
                    margin: EdgeInsets.only(
                        left: _width * 0.15, right: _width * 0.15),
                    height: 300,
                    child: FormBox(),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 2,
                ),
                Transform(
                  transform: Matrix4.translationValues(
                      0, animation3.value * _width, 0),
                  child: Text(
                    'Forgot password?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Transform(
                  transform: Matrix4.translationValues(0, animation3.value * _height, 0),
                  child: buildText(),
                ),
                SizedBox(height: 30),
              ],
            ),
          );
        });
  }

  Widget buildText() {
    return GestureDetector(
      onTap: () {
        print('go to signup form');
        Navigator.pushNamed(context, '/signup');
      },
      child: Text.rich(
        TextSpan(
          text: 'Do not have an account? ',
          style: TextStyle(fontFamily: 'Quicksand'),
          children: <TextSpan>[
            TextSpan(
                text: 'Signup',
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                )),
            // can add more TextSpans here...
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
