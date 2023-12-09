import 'package:falconfinaltester/api_connection/dotnet_api_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:email_validator/email_validator.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({Key? key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  TextEditingController cnicc = TextEditingController();
  TextEditingController emailc = TextEditingController();
  TextEditingController passwordc = TextEditingController();
  TextEditingController confirmPasswordc = TextEditingController();
  TextEditingController contactc = TextEditingController();
  bool _obscurePassword = true;

  double submitButtonFontSize = 16.0; // Initial font size

  Future<void> postData(String cnic, String email, String password,
      String contact, BuildContext context) async {
    final url = APIs.signup
        .replaceFirst('{cnic}', cnic)
        .replaceFirst('{email}', email)
        .replaceFirst('{password}', password)
        .replaceFirst('{contact}', contact);
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
    Navigator.pop(context); // Dismiss the progress dialog
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(response.body);
      Fluttertoast.showToast(msg: response.body.toString());
    } else {
      Fluttertoast.showToast(msg: "Error Occurred");
    }
  }

  void clear() {
    setState(() {
      cnicc.clear();
      emailc.clear();
      passwordc.clear();
      confirmPasswordc.clear();
      contactc.clear();
    });
  }

  var formkey = GlobalKey<FormState>();

  submit() async {
    if (formkey.currentState!.validate()) {
      if (passwordc.text == confirmPasswordc.text) {
        postData(
          cnicc.text,
          emailc.text,
          passwordc.text,
          contactc.text,
          context,
        );
        clear();
      } else {
        Fluttertoast.showToast(msg: "Passwords do not match");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue,
                            Color.fromARGB(255, 44, 89, 252),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.1,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Create an account to get started",
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  TextFormField(
                    controller: cnicc,
                    decoration: InputDecoration(
                      labelText: "CNIC",
                      hintText: "xxxxx-xxxxxxx-x",
                      icon: Icon(Icons.credit_card),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9-]')),
                      // Limit to 16 characters (13 digits + 3 dashes)
                      LengthLimitingTextInputFormatter(16),
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'CNIC is required';
                      } else if (!RegExp(r'^\d{5}-\d{7}-\d{1}$')
                          .hasMatch(value)) {
                        return 'Enter a valid CNIC (e.g., 12345-6789012-3)';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: emailc,
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Enter your email",
                      icon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      } else if (!EmailValidator.validate(value)) {
                        return 'Enter a valid email address example@example.com';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: passwordc,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "********",
                      icon: Icon(Icons.lock),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        child: Icon(
                          _obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: _obscurePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      } else if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$')
                          .hasMatch(value)) {
                        return 'Password must meet the following criteria:\n'
                            '- At least one uppercase letter\n'
                            '- At least one lowercase letter\n'
                            '- At least one number\n'
                            '- At least one special letter';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: confirmPasswordc,
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                      hintText: "Re-enter your password",
                      icon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: contactc,
                    decoration: InputDecoration(
                      labelText: "Contact No",
                      hintText: "0312-3456789",
                      icon: Icon(Icons.phone),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9-]')),
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Contact number is required';
                      } else if (!RegExp(r'^\d{4}-\d{7}$').hasMatch(value)) {
                        return 'Enter a valid contact number (e.g., 0312-3456789)';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: ElevatedButton(
                      onPressed: () {
                        submit();
                      },
                      child: AnimatedDefaultTextStyle(
                        duration: Duration(milliseconds: 300),
                        style: TextStyle(
                          fontSize: submitButtonFontSize,
                        ),
                        child: Text("Submit"),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



// import 'package:falconfinaltester/api_connection/dotnet_api_connection.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import '../Custom_widget/falcon_button.dart';
// import '../Custom_widget/text_feild_palcon.dart';
// import '../Custom_widget/text_palcon.dart';
// import 'package:http/http.dart' as http;

// class Signupscreen extends StatefulWidget {
//   const Signupscreen({Key? key});

//   @override
//   State<Signupscreen> createState() => _SignupscreenState();
// }

// class _SignupscreenState extends State<Signupscreen> {
//   TextEditingController cnicc = TextEditingController();
//   TextEditingController emailc = TextEditingController();
//   TextEditingController passwordc = TextEditingController();
//   TextEditingController contactc = TextEditingController();

  // Future<void> postData(String cnic, String email, String password,
  //     String contact, BuildContext context) async {
  //   final url = APIs.signup
  //       .replaceFirst('{cnic}', cnic)
  //       .replaceFirst('{email}', email)
  //       .replaceFirst('{password}', password)
  //       .replaceFirst('{contact}', contact);
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext dialogContext) {
  //       return Center(
  //         child: CircularProgressIndicator(),
  //       );
  //     },
  //   );
  //   final response = await http.post(Uri.parse(url), body: url.toString());
  //   Navigator.pop(context); // Dismiss the progress dialog
  //   print(response.body);
  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     print(response.statusCode);
  //     print(response.body);
  //     Fluttertoast.showToast(msg: response.body.toString());
  //   } else {
  //     Fluttertoast.showToast(msg: "Error Occurred");
  //   }
  // }

//   void clear() async {
//     cnicc.clear();
//     emailc.clear();
//     passwordc.clear();
//     contactc.clear();
//   }

//   var formkey = GlobalKey<FormState>();

//   submit() async {
//     if (formkey.currentState!.validate()) {
//       postData(
//         cnicc.text,
//         emailc.text,
//         passwordc.text,
//         contactc.text,
//         context,
//       );
//       clear();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Container(
//             padding: EdgeInsets.all(16.0),
//             child: Form(
//               key: formkey,
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.03,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       width: double.infinity,
//                       height: MediaQuery.of(context).size.height * 0.1,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Falcontext(
//                         textvalue: "Sign Up First",
//                         fontsize1: MediaQuery.of(context).size.width * 0.1,
//                         bold1: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.05,
//                   ),
//                   Textfeildpalcon(
//                     controller: cnicc,
//                     labeltext: "CNIC",
//                   ),
//                   Textfeildpalcon(
//                     controller: emailc,
//                     labeltext: "Email",
//                   ),
//                   Textfeildpalcon(
//                     controller: passwordc,
//                     labeltext: "Password",
//                   ),
//                   Textfeildpalcon(
//                     controller: contactc,
//                     labeltext: "Contact No",
//                   ),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.04,
//                   ),
//                   Falconbutton(
//                     onpress: () {
//                       submit();
//                       clear();
//                     },
//                     btn: "Submit",
//                     height1: MediaQuery.of(context).size.height * 0.07,
//                     width1: MediaQuery.of(context).size.width * 0.4,
//                     color1: Colors.blue,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }





// import 'package:falconfinaltester/api_connection/dotnet_api_connection.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import '../Custom_widget/falcon_button.dart';
// import '../Custom_widget/text_feild_palcon.dart';
// import '../Custom_widget/text_palcon.dart';
// import 'package:http/http.dart' as http;

// class Signupscreen extends StatefulWidget {
//   const Signupscreen({super.key});

//   @override
//   State<Signupscreen> createState() => _SignupscreenState();
// }

// class _SignupscreenState extends State<Signupscreen> {
//   TextEditingController cnicc = TextEditingController();
//   TextEditingController emailc = TextEditingController();
//   TextEditingController passwordc = TextEditingController();
//   TextEditingController contactc = TextEditingController();

//   Future<void> postData(String cnic, String email, String password,
//       String contact, BuildContext context) async {
//     final url = APIs.signup
//         .replaceFirst('{cnic}', cnic)
//         .replaceFirst('{email}', email)
//         .replaceFirst('{password}', password)
//         .replaceFirst('{contact}', contact);
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
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//       print(response.statusCode);
//       print(response.body);
//       Fluttertoast.showToast(msg: response.body.toString());
//     } else {
//       Fluttertoast.showToast(msg: "Error Occured");
//     }
//   }

//   void clear() async {
//     cnicc.clear();
//     emailc.clear();
//     passwordc.clear();
//     contactc.clear();
//   }

//   var formkey = GlobalKey<FormState>();

//   submit() async {
//     if (formkey.currentState!.validate()) {
//       postData(
//         cnicc.text,
//         emailc.text,
//         passwordc.text,
//         contactc.text,
//         context,
//       );
//       clear();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Material(
//         child: SingleChildScrollView(
//           child: Container(
//             child: Form(
//               key: formkey,
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       width: double.infinity,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Falcontext(
//                         textvalue: "SignUp First",
//                         fontsize1: 30,
//                         bold1: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 50,
//                   ),
//                   Textfeildpalcon(
//                     controller: cnicc,
//                     labeltext: "CNIC",
//                   ),
//                   Textfeildpalcon(
//                     controller: emailc,
//                     labeltext: "Email",
//                   ),
//                   Textfeildpalcon(
//                     controller: passwordc,
//                     labeltext: "Password",
//                   ),
//                   Textfeildpalcon(
//                     controller: contactc,
//                     labeltext: "Contact No",
//                   ),
//                   SizedBox(
//                     height: 40,
//                   ),
//                   Falconbutton(
//                     onpress: () {
//                       submit();
//                       clear();
//                     },
//                     btn: "Submit",
//                     height1: 50,
//                     width1: 170,
//                     color1: Colors.blue,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
