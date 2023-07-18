import 'package:flutter/material.dart';

class Logo_splash_screen extends StatefulWidget {
  const Logo_splash_screen({Key? key}) : super(key: key);

  @override
  State<Logo_splash_screen> createState() => _Logo_splash_screenState();
}

class _Logo_splash_screenState extends State<Logo_splash_screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: const [
            Image(
              image: AssetImage("images/logo.jpg"),
              width: 200,
            ),
          ],
        ),
      ),
    ));
  }
}
