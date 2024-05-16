import 'package:flutter/material.dart';
import 'package:galindo/screen/signup_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      debugShowCheckedModeBanner: false,
      // A widget which will be started on application startup
      home: SingUpScreen(),
    );
  }
}
