import 'dart:convert';
import 'package:falconfinaltester/api_connection/dotnet_api_connection.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../Custom_widget/falcon_button.dart';
import '../../../../Custom_widget/text_feild_palcon.dart';

class Tab3 extends StatefulWidget {
  const Tab3({super.key});

  @override
  State<Tab3> createState() => _Tab3State();
}

class _Tab3State extends State<Tab3> {
  final TextEditingController vehiclenoc = TextEditingController();
  final TextEditingController namec = TextEditingController();
  final TextEditingController phonec = TextEditingController();
  final TextEditingController cnicc = TextEditingController();
  final TextEditingController visittoc = TextEditingController();
  final TextEditingController remarksc = TextEditingController();
  final TextEditingController datec = TextEditingController();

  Future<void> postData(
      String vehicleno,
      String name,
      String phone,
      String cnic,
      String visitto,
      String remarks,
      String date,
      BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final houseId = prefs.getInt('houseId');
    final houseIdString = houseId.toString();

    // Construct the JSON payload
    final Map<String, dynamic> data = {
      "Houseid": houseIdString,
      "Vehicleno": vehicleno,
      "Name": name,
      "PhoneNo": phone,
      "CNIC": cnic,
      "VisitTo": visitto,
      "Remarks": remarks,
      "Date": date,
      "Image": "string",
      "GatePassType": "Resident",
      "ServantType": "string",
      "Gender": "string",
      "FatherName": "string",
      "DOB": "2023-07-21T06:54:56.851Z",
      "Type": "type", // owner or rent
      "Occupation": "occupation", // type of work they are doing
      "Floor": "floor", // living on the floor
    };

    // Convert the JSON payload to a string
    final jsonData = json.encode(data);
    try {
      final response = await http.post(
        Uri.parse(APIs.visitordet),
        body: jsonData,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        print('Data posted successfully.');
        Fluttertoast.showToast(msg: "Sent Successfully");
      } else {
        print('Failed to post data. Status code: ${response.statusCode}');
        Fluttertoast.showToast(msg: "Connection Error");
      }
    } catch (e) {
      print('Error posting data: $e');
      Fluttertoast.showToast(msg: "Error: $e");
    } finally {
      Navigator.pop(context);
    }
  }

  var formKey = GlobalKey<FormState>();
  submit(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      postData(
        vehiclenoc.text,
        namec.text,
        phonec.text,
        cnicc.text,
        visittoc.text,
        remarksc.text,
        datec.text,
        context,
      );
      clear();
    }
  }

  void clear() {
    setState(() {
      vehiclenoc.clear();
      namec.clear();
      phonec.clear();
      cnicc.clear();
      visittoc.clear();
      remarksc.clear();
      datec.clear();
    });
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
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Textfeildpalcon(
                controller: vehiclenoc,
                maxlinetxtf: 1,
                labeltext: "Vehicle No",
              ),
              Textfeildpalcon(
                controller: namec,
                labeltext: "Name",
                minlinetxtf: 1,
                validate: (v) {
                  if (v!.isEmpty) {
                    return "please Fill The Field";
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
                    return "Please Fill The Field";
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
                    return "Please Fill The Field";
                  }
                  return null;
                },
              ),
              Textfeildpalcon(
                controller: visittoc,
                labeltext: "Visit To",
                minlinetxtf: 1,
                validate: (v) {
                  if (v!.isEmpty) {
                    return "Please Fill The Field";
                  }
                  return null;
                },
              ),
              Textfeildpalcon(
                controller: remarksc,
                labeltext: "Remarks",
                minlinetxtf: 1,
                validate: (v) {
                  if (v!.isEmpty) {
                    return "Please Fill The Field";
                  }
                  return null;
                },
              ),
              Falconbutton(
                btn: "Apply For Card",
                height1: MediaQuery.of(context).size.height * 0.07,
                width1: MediaQuery.of(context).size.width * 0.8,
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





//--------------------------------------------------------------------------------------------------------------------------
// import 'dart:convert';
// import 'package:falconfinaltester/api_connection/dotnet_api_connection.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../../../Custom_widget/falcon_button.dart';
// import '../../../../Custom_widget/text_feild_palcon.dart';

// class Tab3 extends StatefulWidget {
//   const Tab3({super.key});

//   @override 
//   State<Tab3> createState() => _Tab3State();
// }

// class _Tab3State extends State<Tab3> {
//   final TextEditingController vehiclenoc = TextEditingController();
//   final TextEditingController namec = TextEditingController();
//   final TextEditingController phonec = TextEditingController();
//   final TextEditingController cnicc = TextEditingController();
//   final TextEditingController visittoc = TextEditingController();
//   final TextEditingController remarksc = TextEditingController();
//   final TextEditingController datec = TextEditingController();

//   Future<void> postData(
//       String vehicleno,
//       String name,
//       String phone,
//       String cnic,
//       String visitto,
//       String remarks,
//       String date,
//       BuildContext context) async {
//     // final apiUrl = 'http://182.191.69.176:8060/api/Tenant/GenerateGatePass';
//     final prefs = await SharedPreferences.getInstance();
//     final houseId = prefs.getInt('houseId');
//     final houseIdString = houseId.toString();

//     // Construct the JSON payload
//     final Map<String, dynamic> data = {
//       "Houseid": houseIdString,
//       "Vehicleno": vehicleno,
//       "Name": name,
//       "PhoneNo": phone,
//       "CNIC": cnic,
//       "VisitTo": visitto,
//       "Remarks": remarks,
//       "Date": "2023-07-21T06:54:56.851Z",
//       "Image": "string",
//       "GatePassType": "Resident",
//       "ServantType": "string",
//       "Gender": "string",
//       "FatherName": "string",
//       "DOB": "2023-07-21T06:54:56.851Z",
//       "Type": "type", // owner or rent
//       "Occupation": "occupation", //type of work they doing
//       "Floor": "floor", // living in the floor
//     };

//     // Convert the JSON payload to a string
//     final jsonData = json.encode(data);
//     print(data);
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext dialogContext) {
//         return Center(
//           child: CircularProgressIndicator(),
//           // Adjust the radius as needed
//         );
//       },
//     );

//     // Make an HTTP POST request
//     try {
//       final response = await http.post(
//         Uri.parse(APIs.visitordet),
//         body: jsonData,
//         headers: {
//           'Content-Type':
//               'application/json', // Set the appropriate content-type for JSON
//         },
//       );

//       if (response.statusCode == 200) {
//         // Request successful, handle the response here if needed.
//         print('Data posted successfully.');
//         Fluttertoast.showToast(msg: "Sent Successfully");
//       } else {
//         // Request failed, handle the error here if needed.
//         print('Failed to post data. Status code: ${response.statusCode}');
//         Fluttertoast.showToast(msg: "Connection Error");
//       }
//     } catch (e) {
//       // Handle any exceptions that occur during the HTTP request.
//       print('Error posting data: $e');
//       Fluttertoast.showToast(msg: "Error: $e");
//     } finally {
//       // Hide the loading indicator (circular avatar)
//       Navigator.pop(context);
//     }
//   }

//   var formKey = GlobalKey<FormState>();
//   submit(BuildContext context) async {
//     if (formKey.currentState!.validate()) {
//       postData(
//         vehiclenoc.text,
//         namec.text,
//         phonec.text,
//         cnicc.text,
//         visittoc.text,
//         remarksc.text,
//         datec.text,
//         context,
//       );
//       clear();
//     }
//   }

//   void clear() async {
//     vehiclenoc.clear();
//     namec.clear();
//     phonec.clear();
//     cnicc.clear();
//     visittoc.clear();
//     remarksc.clear();
//     datec.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Form(
//           key: formKey,
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 15,
//               ),
//               Textfeildpalcon(
//                 controller: vehiclenoc,
//                 maxlinetxtf: 1,
//                 labeltext: "Vehicle No",
//                 // validate: (v) {
//                 //   if (v!.isEmpty) {
//                 //     return "please fill the feild";
//                 //   }
//                 //   return null;
//                 // },
//               ),
//               Textfeildpalcon(
//                 controller: namec,
//                 labeltext: "Name",
//                 minlinetxtf: 1,
//                 validate: (v) {
//                   if (v!.isEmpty) {
//                     return "please Fill The Feild";
//                   }
//                   return null;
//                 },
//               ),
//               Textfeildpalcon(
//                 controller: phonec,
//                 labeltext: "Phone No",
//                 minlinetxtf: 1,
//                 validate: (v) {
//                   if (v!.isEmpty) {
//                     return "Please Fill The Feild";
//                   }
//                   return null;
//                 },
//               ),
//               Textfeildpalcon(
//                 controller: cnicc,
//                 labeltext: "CNIC",
//                 minlinetxtf: 1,
//                 validate: (v) {
//                   if (v!.isEmpty) {
//                     return "Please Fill The Feild";
//                   }
//                   return null;
//                 },
//               ),
//               // Textfeildpalcon(
//               //   controller: visittoc,
//               //   labeltext: "temprary",
//               //   minlinetxtf: 1,
//               //   validate: (v) {
//               //     if (v!.isEmpty) {
//               //       return "Please Fill The Feild";
//               //     }
//               //     return null;
//               //   },
//               // ),
//               Textfeildpalcon(
//                 controller: remarksc,
//                 labeltext: "Residential Detail",
//                 minlinetxtf: 1,
//                 validate: (v) {
//                   if (v!.isEmpty) {
//                     return "Please Fill The Feild";
//                   }
//                   return null;
//                 },
//               ),
//               Falconbutton(
//                 btn: "Apply For Card",
//                 height1: 50,
//                 width1: 250,
//                 color1: Colors.blue,
//                 fontweihtbtn: FontWeight.bold,
//                 onpress: () {
//                   submit(context);
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
