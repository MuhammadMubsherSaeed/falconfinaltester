// import 'dart:convert';
// import 'package:falconfinaltester/Screens/signup_screen.dart';
// import 'package:falconfinaltester/api_connection/dotnet_api_connection.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import '../Custom_widget/falcon_button.dart';
// import '../Custom_widget/text_feild_palcon.dart';
// // import '../Custom_widget/text_palcon.dart';
// import 'home/home_page.dart';

// class Loginscreen extends StatefulWidget {
//   const Loginscreen({super.key});

//   @override
//   State<Loginscreen> createState() => _LoginscreenState();
// }

// class _LoginscreenState extends State<Loginscreen> {
//   TextEditingController emailc = TextEditingController();
//   TextEditingController passwordc = TextEditingController();

//   Future<void> postData(
//       String email, String password, BuildContext context) async {
//     final url = APIs.signin
//         .replaceFirst('{email}', email)
//         .replaceFirst('{password}', password);

//     // Show circular progress indicator while waiting for the response
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext dialogContext) {
//         return Center(
//           child: CircularProgressIndicator(),
//         );
//       },
//     );

//     final response = await http.post(Uri.parse(url), body: url.toString());
//     Navigator.pop(context); // Dismiss the progress dialog

//     print(response.body);

//     if (response.statusCode == 200) {
//       final jsonData = jsonDecode(response.body);
//       var houseid = jsonData['HouseId'];
//       var id = jsonData['Id'];
//       final prefs = await SharedPreferences.getInstance();
//       prefs.setInt('houseId', houseid);
//       prefs.setInt('id', id);
//       Get.to(Homescreen());
//       print(houseid);
//       Fluttertoast.showToast(msg: "Login Successfully");
//     } else {
//       Fluttertoast.showToast(msg: response.body.toString());
//     }
//   }

//   var formkey = GlobalKey<FormState>();

//   submit(BuildContext context) async {
//     if (formkey.currentState!.validate()) {
//       postData(emailc.text, passwordc.text, context);
//     } else {
//       Fluttertoast.showToast(msg: "Error occure");
//     }
//   }

//   void clear() async {
//     emailc.clear();
//     passwordc.clear();
//   }

//   bool ispasswordvalue = true;

//   void toggleobscered() {
//     setState(() {
//       ispasswordvalue = !ispasswordvalue;
//     });
//   }

//   void handleLogout(BuildContext context) {
//     Navigator.pushNamedAndRemoveUntil(
//       context,
//       '/LoginScreen',
//       (route) => false,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: SafeArea(
//         child: SingleChildScrollView(
//           child: Container(
//             color: Color.fromARGB(255, 247, 244, 248),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(bottom: 40),
//                   child: Stack(
//                     children: [
//                       Center(
//                         child: SizedBox(
//                           width: MediaQuery.sizeOf(context).width * 0.6,
//                           height: MediaQuery.sizeOf(context).height * 0.25,
//                           child: Image.asset(
//                             "Assets/Images/new.png",
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                       ),
//                       // Falcontext(
//                       //   fontsize1: 30,
//                       //   textvalue: "Welcome To \n    Falcon",
//                       //   bold1: FontWeight.bold,
//                       // ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(25.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: Form(
//                       key: formkey,
//                       child: Column(
//                         children: [
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Textfeildpalcon(
//                             maxlinetxtf: 1,
//                             validate: (v) {
//                               if (v!.isEmpty) {
//                                 return "please fill all the fields";
//                               } else if (!v.contains('@')) {
//                                 return "please insert @";
//                               }
//                               return null;
//                             },
//                             icons: Icons.email,
//                             controller: emailc,
//                             labeltext: "Enter Email...",
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Textfeildpalcon(
//                             maxlinetxtf: 1,
//                             validate: (v) {
//                               if (v!.isEmpty) {
//                                 return "please fill all the fields";
//                               }
//                               return null;
//                             },
//                             icon: Icon(Icons.remove_red_eye),
//                             controller: passwordc,
//                             labeltext: "Enter Pass...",
//                             icons: ispasswordvalue
//                                 ? Icons.visibility
//                                 : Icons.visibility_off,
//                             onpress: toggleobscered,
//                             ispassword: !ispasswordvalue,
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Falconbutton(
//                             onpress: () {
//                               submit(context);
//                               clear();
//                             },
//                             btn: "LOGIN",
//                             fontsizebtn: 20,
//                             fontweihtbtn: FontWeight.bold,
//                             height1: 50,
//                             width1: 120,
//                             color1: Colors.blue,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 70,
//                 ),
//                 Falconbutton(
//                   btn: "SignUp",
//                   onpress: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => Signupscreen(),
//                       ),
//                     );
//                   },
//                   fontsizebtn: 25,
//                   fontweihtbtn: FontWeight.bold,
//                   height1: 60,
//                   width1: double.infinity,
//                   color1: Colors.blue,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';
import 'package:falconfinaltester/Screens/signup_screen.dart';
import 'package:falconfinaltester/api_connection/dotnet_api_connection.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Custom_widget/falcon_button.dart';
import '../Custom_widget/text_feild_palcon.dart';
// import '../Custom_widget/text_palcon.dart';
import 'home/home_page.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Loginscreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isPasswordVisible = true;

  Future<void> postData(
      String email, String password, BuildContext context) async {
    final url = APIs.signin
        .replaceFirst('{email}', email)
        .replaceFirst('{password}', password);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    final response = await http.post(Uri.parse(url), body: url.toString());
    Navigator.pop(context);

    print(response.body);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      var houseId = jsonData['HouseId'];
      var id = jsonData['Id'];
      final prefs = await SharedPreferences.getInstance();
      prefs.setInt('houseId', houseId);
      prefs.setInt('id', id);
      Get.to(Homescreen());
      print(houseId);
      Fluttertoast.showToast(msg: "Login Successfully");
    } else {
      Fluttertoast.showToast(msg: response.body.toString());
    }
  }

  var formKey = GlobalKey<FormState>();

  void submit(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      postData(emailController.text, passwordController.text, context);
    } else {
      Fluttertoast.showToast(msg: "Error occurred");
    }
  }

  void clear() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Color.fromARGB(255, 247, 244, 248),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 40),
                  child: Stack(
                    children: [
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: Image.asset(
                            "Assets/Images/new.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Textfeildpalcon(
                            maxlinetxtf: 1,
                            validate: (v) {
                              if (v!.isEmpty) {
                                return "Please fill all the fields";
                              } else if (!v.contains('@')) {
                                return "Please insert @";
                              }
                              return null;
                            },
                            icons: Icons.email,
                            controller: emailController,
                            labeltext: "Enter Email...",
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Textfeildpalcon(
                            maxlinetxtf: 1,
                            validate: (v) {
                              if (v!.isEmpty) {
                                return "Please fill all the fields";
                              }
                              return null;
                            },
                            icons: Icons.remove_red_eye,
                            controller: passwordController,
                            labeltext: "Enter Password...",
                            obscureText: isPasswordVisible,
                            suffixIcon: IconButton(
                              icon: Icon(
                                isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Falconbutton(
                            onpress: () {
                              submit(context);
                              clear();
                            },
                            btn: "LOGIN",
                            fontsizebtn: 20,
                            fontweihtbtn: FontWeight.bold,
                            height1: 50,
                            width1: 120,
                            color1: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Falconbutton(
                  btn: "SignUp",
                  onpress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Signupscreen(),
                      ),
                    );
                  },
                  fontsizebtn: 25,
                  fontweihtbtn: FontWeight.bold,
                  height1: 60,
                  width1: double.infinity,
                  color1: Colors.blue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
