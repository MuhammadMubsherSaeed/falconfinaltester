import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../Custom_widget/falcon_button.dart';
import '../../../../Custom_widget/text_feild_palcon.dart';
import '../../../../api_connection/dotnet_api_connection.dart';

class Tab2 extends StatefulWidget {
  const Tab2({super.key});

  @override
  State<Tab2> createState() => _Tab2State();
}

enum Building { owner, tanent }

class _Tab2State extends State<Tab2> {
  final TextEditingController namec = TextEditingController();
  final TextEditingController cnicc = TextEditingController();
  final TextEditingController phonec = TextEditingController();
  final TextEditingController servantc = TextEditingController();
  final TextEditingController genderc = TextEditingController();
  final TextEditingController fatherc = TextEditingController();
  final TextEditingController iamgec = TextEditingController();
  final TextEditingController dobc = TextEditingController();
  final TextEditingController joindatec = TextEditingController();
  final TextEditingController radioValueController = TextEditingController();

  Future<void> postData(
      String name,
      String cnic,
      String phone,
      String servanttype,
      String gender,
      String fathername,
      String iamge,
      String dob,
      String joindate,
      BuildContext context) async {
    // final apiUrl = 'http://182.191.69.176:8060/api/Tenant/GenerateGatePass';
    final prefs = await SharedPreferences.getInstance();
    final houseId = prefs.getInt('houseId');
    final houseIdString = houseId.toString();

    // Construct the JSON payload
    final Map<String, dynamic> data = {
      "Houseid": houseIdString,
      "Vehicleno": "string",
      "Name": name, //name of the person
      "PhoneNo": phone, // phone number the person
      "CNIC": cnic, // cnic of the person
      "VisitTo": "string",
      "Remarks": "string",
      "Date": joindate,
      "Image": "iamge",
      "GatePassType": "Servant",
      "ServantType":
          servanttype, // this is type of servant like gardian and made etc
      "Gender": gender,
      "FatherName": fathername,
      "DOB": dob,
      "Type": "type", // owner or rent
      "Occupation": "occupation", //type of work they doing
      "Floor": "floor", // living in the floor
    };

    // Convert the JSON payload to a string
    final jsonData = json.encode(data);
    print(data);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return Center(
          child: CircularProgressIndicator(),
          // Adjust the radius as needed
        );
      },
    );

    // Make an HTTP POST request
    try {
      final response = await http.post(
        Uri.parse(APIs.servantdet),
        body: jsonData,
        headers: {
          'Content-Type':
              'application/json', // Set the appropriate content-type for JSON
        },
      );

      if (response.statusCode == 200) {
        // Request successful, handle the response here if needed.
        print('Data posted successfully.');
        Fluttertoast.showToast(msg: "Sent Successfully");
      } else {
        // Request failed, handle the error here if needed.
        print('Failed to post data. Status code: ${response.statusCode}');
        Fluttertoast.showToast(msg: "Connection Error");
      }
    } catch (e) {
      // Handle any exceptions that occur during the HTTP request.
      print('Error posting data: $e');
      Fluttertoast.showToast(msg: "Error: $e");
    } finally {
      // Hide the loading indicator (circular avatar)
      Navigator.pop(context);
    }
  }

  var formKey = GlobalKey<FormState>();
  submit(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      postData(
        namec.text,
        cnicc.text,
        phonec.text,
        servantc.text,
        radioValueController.text,
        fatherc.text,
        iamgec.text,
        dobc.text,
        joindatec.text,
        context,
      );
      clear();
    }
  }

  void clear() async {
    namec.clear();
    cnicc.clear();
    phonec.clear();
    servantc.clear();
    genderc.clear();
    fatherc.clear();
    iamgec.clear();
    dobc.clear();
  }

  Building _building = Building.owner;

  @override
  void initState() {
    super.initState();
    radioValueController.text = _building == Building.owner ? "Male" : "Female";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Textfeildpalcon(
                controller: namec,
                maxlinetxtf: 1,
                labeltext: "Name",
                validate: (v) {
                  if (v!.isEmpty) {
                    return "please fill the feild";
                  }
                  return null;
                },
              ),
              Textfeildpalcon(
                controller: cnicc,
                labeltext: "CNIC",
                minlinetxtf: 1,
                validate: (v) {
                  if (v!.isEmpty) {
                    return "please Fill The Feild";
                  }
                  return null;
                },
              ),
              Textfeildpalcon(
                controller: phonec,
                labeltext: "Phone No",
                minlinetxtf: 1,
                validate: (v) {
                  if (v!.isEmpty) {
                    return "Please Fill The Feild";
                  }
                  return null;
                },
              ),
              Textfeildpalcon(
                controller: servantc,
                labeltext: "Designation of Servant",
                minlinetxtf: 1,
                validate: (v) {
                  if (v!.isEmpty) {
                    return "Please Fill The Feild";
                  }
                  return null;
                },
              ),
              Textfeildpalcon(
                controller: fatherc,
                labeltext: "father/Husband Name",
                minlinetxtf: 1,
                validate: (v) {
                  if (v!.isEmpty) {
                    return "Please Fill The Feild";
                  }
                  return null;
                },
              ),

              // Textfeildpalcon(
              //   controller: iamgec,
              //   labeltext: "Image Of Servant",
              //   minlinetxtf: 1,
              //   validate: (v) {
              //     if (v!.isEmpty) {
              //       return "Please Fill The Feild";
              //     }
              //     return null;
              //   },
              // ),
              Textfeildpalcon(
                controller: dobc,
                hintext: "2023-01-05",
                labeltext: "Servant Date Of Birth",
                minlinetxtf: 1,
                validate: (v) {
                  if (v!.isEmpty) {
                    return "Please Fill The Feild";
                  }
                  return null;
                },
              ),
              Textfeildpalcon(
                controller: joindatec,
                hintext: "2018-07-16",
                labeltext: "Joining Date",
                minlinetxtf: 1,
                validate: (v) {
                  if (v!.isEmpty) {
                    return "Please Fill The Feild";
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Gender",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Radio(
                            value: Building.owner,
                            groupValue: _building,
                            onChanged: (building) {
                              setState(() {
                                _building = building!;
                                radioValueController.text = "Male";
                              });
                            }),
                        Text(
                          "Male",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Radio(
                          value: Building.tanent,
                          groupValue: _building,
                          onChanged: (building) {
                            setState(() {
                              _building = building!;
                              radioValueController.text = "Female";
                            });
                          },
                        ),
                        Text(
                          "Female",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Falconbutton(
                btn: "Apply For Card",
                height1: 50,
                width1: 250,
                color1: Colors.blue,
                fontweihtbtn: FontWeight.bold,
                onpress: () {
                  submit(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
