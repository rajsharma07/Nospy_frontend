import 'package:flutter/material.dart';
import 'package:nospy/login.dart';
void main() => runApp(
      NoSpyApp(),
    );

class NoSpyApp extends StatelessWidget {
  NoSpyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NoSpy',
      home: Scaffold(body: LogIn(),)
    );
  }
}
