import 'package:falconfinaltester/api_connection/dotnet_api_connection.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Custom_widget/falcon_button.dart';
import '../Custom_widget/text_feild_palcon.dart';
import '../Custom_widget/text_palcon.dart';
import 'package:http/http.dart' as http;

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  TextEditingController cnicc = TextEditingController();
  TextEditingController emailc = TextEditingController();
  TextEditingController passwordc = TextEditingController();
  TextEditingController contactc = TextEditingController();

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
      Fluttertoast.showToast(msg: "Error Occured");
    }
  }

  void clear() async {
    cnicc.clear();
    emailc.clear();
    passwordc.clear();
    contactc.clear();
  }

  var formkey = GlobalKey<FormState>();

  submit() async {
    if (formkey.currentState!.validate()) {
      postData(
        cnicc.text,
        emailc.text,
        passwordc.text,
        contactc.text,
        context,
      );
      clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: SingleChildScrollView(
          child: Container(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Falcontext(
                        textvalue: "SignUp First",
                        fontsize1: 30,
                        bold1: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Textfeildpalcon(
                    controller: cnicc,
                    labeltext: "CNIC",
                  ),
                  Textfeildpalcon(
                    controller: emailc,
                    labeltext: "Email",
                  ),
                  Textfeildpalcon(
                    controller: passwordc,
                    labeltext: "Password",
                  ),
                  Textfeildpalcon(
                    controller: contactc,
                    labeltext: "Contact No",
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Falconbutton(
                    onpress: () {
                      submit();
                      clear();
                    },
                    btn: "Submit",
                    height1: 50,
                    width1: 170,
                    color1: Colors.blue,
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
