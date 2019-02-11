import 'package:flutter/material.dart';
import '../widgets/form_box.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(height: _height * 0.15),
          Text(
            'Welcome back',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF36BA7A),
              fontSize: 20,
              fontFamily: 'Quicksand',
            ),
          ),
          SizedBox(height: 40),
          Container(
            margin: EdgeInsets.only(left: _width * 0.15, right: _width * 0.15),
            height: 300,
            child: FormBox(),
          ),
          SizedBox(height: 50, width: 2,),
          Text(
            'Forgot password?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Quicksand',
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 12),
          buildText(),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget buildText() {
    return GestureDetector(
      onTap: (){print('go to signup form');},
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

