import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/splash_screen/logo_splash.dart';
import 'package:travel_app/users/authentication/signin.dart';

void main() {
//  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        builder: (context, dataSnapshot) {
          return const Signin_page();
        },
      ),
    );
  }
}
