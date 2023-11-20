import 'dart:async';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Loginscreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        color: Color.fromARGB(255, 240, 246, 255),
        child: Center(
          child: Image.asset("Assets/Images/new.png"),
          // Text(
          //   "AFOHS",
          //   style: TextStyle(
          //     fontSize: 90,
          //     fontWeight: FontWeight.bold,
          //     color: Color.fromARGB(255, 59, 248, 255),
          //   ),
        ),
      ),
    );
  }
}
