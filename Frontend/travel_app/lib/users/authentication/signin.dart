import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:travel_app/users/Screens/Home.dart';
import 'package:travel_app/users/authentication/signup.dart';
import 'package:http/http.dart' as http;

import '../../api_connection/api_connection.dart';

class Signin_page extends StatefulWidget {
  const Signin_page({Key? key}) : super(key: key);

  @override
  State<Signin_page> createState() => _Signin_pageState();
}

class _Signin_pageState extends State<Signin_page> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isVisibility = true.obs;

  late String userName;

  void userSignIn() async {
    try {
      var response = await http.post(Uri.parse(API.signin), body: {
        "user_email": emailController.text.trim(),
        "user_password": passwordController.text.trim(),
      });

      if (response.statusCode == 200) {
        var resBodySignIn = jsonDecode(response.body);

        if (resBodySignIn['login_success'] == true) {
          userName = resBodySignIn['user'];
          print("$userName\n");
          Fluttertoast.showToast(msg: "Sign In Successfully..");
          Get.to(Home_screen(userName));
          emailController.text = "";
          passwordController.text = "";
        } else {
          Fluttertoast.showToast(msg: "Sign In Unsuccessfully..");
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: LayoutBuilder(
          builder: (context, cons) {
            return Stack(
              children: [
                // SizedBox(
                //   width: MediaQuery.of(context).size.width,
                //   height: 300,
                //   child: Image.asset("images/mountain.jpg"),
                // ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: cons.maxHeight,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                          child: Image.asset("images/mountain.jpg"),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white24,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(60)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 8,
                                  offset: Offset(0, -3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  // sign in Form
                                  Form(
                                    key: formKey,
                                    child: Column(
                                      children: [
                                        // Form Email
                                        TextFormField(
                                          controller: emailController,
                                          validator: (value) => value == ""
                                              ? "Please Enter Email"
                                              : null,
                                          decoration: const InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.email,
                                              color: Colors.black,
                                            ),
                                            hintText: "Email ...",
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30)),
                                                borderSide: BorderSide(
                                                    color: Colors.white60)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30)),
                                                borderSide: BorderSide(
                                                    color: Colors.white60)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30)),
                                                borderSide: BorderSide(
                                                    color: Colors.white60)),
                                            disabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30)),
                                                borderSide: BorderSide(
                                                    color: Colors.white60)),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 40,
                                                    vertical: 6),
                                            fillColor: Colors.white,
                                            filled: true,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),

                                        // Form Password
                                        Obx(
                                          () => TextFormField(
                                            controller: passwordController,
                                            validator: (value) => value == ""
                                                ? "Please Enter Password"
                                                : null,
                                            obscureText: isVisibility
                                                .value, // using for password Secure
                                            decoration: InputDecoration(
                                              prefixIcon: const Icon(
                                                Icons.key,
                                                color: Colors.black,
                                              ),
                                              hintText: "Password ...",
                                              border: const OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(30)),
                                                  borderSide: BorderSide(
                                                      color: Colors.white60)),
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  30)),
                                                      borderSide: BorderSide(
                                                          color:
                                                              Colors.white60)),
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  30)),
                                                      borderSide: BorderSide(
                                                          color:
                                                              Colors.white60)),
                                              disabledBorder:
                                                  const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  30)),
                                                      borderSide: BorderSide(
                                                          color:
                                                              Colors.white60)),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 40,
                                                      vertical: 6),
                                              fillColor: Colors.white,
                                              filled: true,
                                              suffixIcon: Obx(
                                                () => GestureDetector(
                                                  onTap: () {
                                                    isVisibility.value =
                                                        !isVisibility.value;
                                                  },
                                                  child: Icon(
                                                    isVisibility.value
                                                        ? Icons.visibility_off
                                                        : Icons.visibility,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),

                                        // Sign In button
                                        Material(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: InkWell(
                                            onTap: () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                userSignIn();
                                              }
                                            },
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 15,
                                                horizontal: 40,
                                              ),
                                              child: Text(
                                                "Sign In",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Don't have an account ?",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      // Sign Up Button (Don't have account)
                                      TextButton(
                                        onPressed: () {
                                          Get.to(const Signup_page());
                                        },
                                        child: const Text(
                                          "Sign Up Here",
                                          style: TextStyle(
                                            color: Colors.orange,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Forget Password?
                                      TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          "Forget Password",
                                          style: TextStyle(
                                            color: Colors.orange,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
