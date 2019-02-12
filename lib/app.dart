import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import 'screens/signup_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'animated login form',
      home: LoginPage(),
      routes: {
        '/signup' : (BuildContext context) => SignupPage()
      },
    );
  }
}
