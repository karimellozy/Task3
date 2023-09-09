import 'package:flutter/material.dart';
import 'package:untitled3/src/screens/home_screen.dart';
import 'package:untitled3/src/screens/log_in.dart';

// ignore: camel_case_types
class appRoot extends StatelessWidget {
  const appRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogIn(),
    );
  }
}
