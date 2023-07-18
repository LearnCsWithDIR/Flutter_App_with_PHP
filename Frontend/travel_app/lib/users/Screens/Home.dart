import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home_screen extends StatefulWidget {
  String user;
  Home_screen(this.user, {Key? key}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState(user);
}

class _Home_screenState extends State<Home_screen> {
  var user;
  _Home_screenState(this.user);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          //leading: const Icon(Icons.list_rounded),
          title: Text("$user"),
        ),
      ),
    );
  }
}
