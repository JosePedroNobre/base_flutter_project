import 'package:flutter/material.dart';
import 'package:movies/ui/login/WelcomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter login UI',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        primaryColor: Color(0xFF0A0E21),
        accentColor: Colors.blue,
        primarySwatch: Colors.blue,
      ),
      home: WelcomeScreen(),
    );
  }
}
