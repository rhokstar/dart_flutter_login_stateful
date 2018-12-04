import 'package:flutter/material.dart';
import './screens/login_screen.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return MaterialApp(
      title: 'Log In',
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}