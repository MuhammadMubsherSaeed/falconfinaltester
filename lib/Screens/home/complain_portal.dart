// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';
import 'package:falconfinaltester/Screens/home/building_altration.dart';
import 'package:falconfinaltester/Screens/home/dues/duesportal.dart';
import 'package:falconfinaltester/Screens/home/e_tag.dart';
import 'package:falconfinaltester/Screens/home/home_page.dart';
import 'package:falconfinaltester/Screens/home/pet_reg.dart';
import 'package:falconfinaltester/Screens/home/visitorcard/visitor_card.dart';
import 'package:falconfinaltester/api_connection/dotnet_api_connection.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Custom_widget/falcon_button.dart';
import '../../Custom_widget/text_feild_palcon.dart';

class Complainportal extends StatefulWidget {
  const Complainportal({super.key});

  @override
  _ComplainportalState createState() => _ComplainportalState();
}

class _ComplainportalState extends State<Complainportal> {
  int _selectedIndex = 1;
  TextEditingController complaintTitleController = TextEditingController();
  TextEditingController complaintDetailController = TextEditingController();

  List<Map<String, dynamic>> complaintsList = [];

  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> postData(String complaintTitle, String complaintDetail) async {
    final prefs = await SharedPreferences.getInstance();
    final houseId = prefs.getInt('houseId');
    final url = APIs.sendcomplanit
        .replaceFirst('{complaintT}', complaintTitle)
        .replaceFirst('{houseId}', houseId.toString())
        .replaceFirst('{complaintdet}', complaintDetail);

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
    print(response.statusCode);
    Navigator.pop(context);

    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: "Sent Successfully");
    } else {
      print("Error: ${response.statusCode} - ${response.body}");
      Fluttertoast.showToast(msg: "Connection Error: ${response.statusCode}");
    }
  }

  Future<void> fetchData() async {
    try {
      List<Map<String, dynamic>> data = await fetchComplaintsList();
      setState(() {
        complaintsList = data;
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<List<Map<String, dynamic>>> fetchComplaintsList() async {
    final prefs = await SharedPreferences.getInstance();
    final houseId = prefs.getInt('houseId');
    final url =
        APIs.showcomplaint.replaceFirst('{houseid}', houseId.toString());

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as List<dynamic>;
      return jsonData.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load data');
    }
  }

  submit() async {
    if (formKey.currentState!.validate()) {
      postData(
        complaintTitleController.text,
        complaintDetailController.text,
      );
      clear();
      checkData();
      fetchData();
    }
  }

  void clear() {
    complaintTitleController.clear();
    complaintDetailController.clear();
  }

  void checkData() async {
    final per = await SharedPreferences.getInstance();
    final houseid = per.get('houseId');
    print('this is houseid $houseid');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Complaint Portal"),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                // SizedBox(height: 15),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Container(
                //     width: double.infinity,
                //     height: 50,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(12),
                //     ),
                //     child: Falcontext(
                //       textvalue: "Complaint Portal",
                //       fontsize1: MediaQuery.of(context).size.width * 0.05,
                //       bold1: FontWeight.bold,
                //     ),
                //   ),
                // ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Textfeildpalcon(
                        validate: (v) {
                          if (v!.isEmpty) {
                            return "Please describe the title";
                          }
                          return null;
                        },
                        labeltext: "Complaint Title",
                        controller: complaintTitleController,
                      ),
                      Textfeildpalcon(
                        validate: (v) {
                          if (v!.isEmpty) {
                            return "Please describe the complaint detail";
                          }
                          return null;
                        },
                        controller: complaintDetailController,
                        labeltext: "Complaint Detail",
                        minlinetxtf: 9,
                      ),
                      Falconbutton(
                        onpress: submit,
                        btn: "Submit",
                        height1: MediaQuery.of(context).size.height * 0.07,
                        width1: MediaQuery.of(context).size.width * 0.8,
                        color1: Colors.blue,
                        fontweihtbtn: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: complaintsList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(complaintsList[index]['Title']),
                        subtitle: Text(complaintsList[index]['Complaint']),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor:
                Color.fromARGB(255, 71, 156, 240), // Set the background color
            unselectedItemColor: Colors.grey, // Set the background color
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.comment),
                label: 'Complaints',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.money_outlined),
                label: 'Dues & Fines',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.car_crash_sharp),
                label: 'E-TAG Registration',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.door_back_door_outlined),
                label: 'Card Issuance',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.pets),
                label: 'Pets Registration',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.house_rounded),
                label: 'Building Alterations',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Color.fromARGB(255, 11, 162, 34),
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Handle navigation based on the index (0, 1, 2, etc.)
    switch (index) {
      case 0:
        // Navigate to the first screen (Complaint Portal)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Homescreen()),
        );
        break;
      case 1:
        // Navigate to the second screen (Dues and Fines)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Complainportal()),
        );
        break;
      case 2:
        // Navigate to the second screen (Dues and Fines)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => DuesandBillPortal()),
        );
        break;
      case 3:
        // Navigate to the second screen (Dues and Fines)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Etag()),
        );
        break;
      case 4:
        // Navigate to the second screen (Dues and Fines)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => VisitorCard()),
        );
        break;
      case 5:
        // Navigate to the second screen (Dues and Fines)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Petreg()),
        );
        break;
      case 6:
        // Navigate to the second screen (Dues and Fines)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Buildingalteration()),
        );
        break;
      // Add cases for other screens as needed
    }
  }
}
          



// class Complainportal extends StatefulWidget {
//   const Complainportal({super.key});

//   @override
//   State<Complainportal> createState() => _ComplainportalState();
// }

// TextEditingController complaintTc = TextEditingController();
// TextEditingController complaintc = TextEditingController();

// Future<void> postData(
//     String complaintT, String complaintdet, BuildContext context) async {
//   final prefs = await SharedPreferences.getInstance();
//   final houseId = prefs.getInt('houseId');
//   final stringhouseid = houseId.toString();
//   final url = APIs.sendcomplanit
//       .replaceFirst('{complaintT}', complaintT)
//       .replaceFirst('{houseId}', stringhouseid)
//       .replaceFirst('{complaintdet}', complaintdet);
//   // 'http://182.191.69.176:8060/api/Tenant/Complaint?Title=$complaintT&Houseid=$houseId&Complaint=$complaintdet';

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
//   print(response.statusCode);
//   Navigator.pop(context);
//   if (response.statusCode == 200) {
//     Fluttertoast.showToast(msg: "Sent Successfully");
//   } else {
//     //
//     print("Error: ${response.statusCode} - ${response.body}");
//     Fluttertoast.showToast(msg: "Connection Error: ${response.statusCode}");
//   }
// }

// Future<void> checkData() async {
//   final per = await SharedPreferences.getInstance();
//   final houseid = per.get('houseId');
//   print('this is houseid $houseid');
// }

// var formKey = GlobalKey<FormState>();

// submit(BuildContext context) async {
//   if (formKey.currentState!.validate()) {
//     postData(complaintTc.text, complaintc.text, context);
//   }
// }

// void clear() async {
//   complaintTc.clear();
//   complaintc.clear();
// }

// class _ComplainportalState extends State<Complainportal> {
//   List<Map<String, dynamic>> complaintsList = [];

//   Future<List<Map<String, dynamic>>> fetchComplaintsList(String houseId) async {
//     final per = await SharedPreferences.getInstance();
//     final houseid = per.get('houseId');
//     final stringhouseid = houseid.toString();
//     print(houseid);
//     final url = APIs.showcomplaint.replaceFirst('{houseid}', stringhouseid);

//     // 'http://182.191.69.176:8060/api/Tenant/ComplaintsList?Houseid=$houseid';
//     final response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       final jsonData = json.decode(response.body) as List<dynamic>;
//       return jsonData.cast<Map<String, dynamic>>();
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//   Future<void> fetchData() async {
//     try {
//       List<Map<String, dynamic>> data = await fetchComplaintsList("ali");
//       setState(() {
//         complaintsList = data;
//       });
//     } catch (e) {
//       print("Error: $e");
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Material(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 15,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   width: double.infinity,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Falcontext(
//                     textvalue: "Complaint Portal",
//                     fontsize1: MediaQuery.of(context).size.width * 0.05,
//                     bold1: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Container(
//                 height:
//                     MediaQuery.of(context).size.height * 0.7, // Adjust height
//                 child: Form(
//                   key: formKey,
//                   child: Column(
//                     children: [
//                       Textfeildpalcon(
//                         validate: (v) {
//                           if (v!.isEmpty) {
//                             return "please describe the title";
//                           }
//                           return null;
//                         },
//                         labeltext: "Complaint Title",
//                         controller: complaintTc,
//                       ),
//                       Textfeildpalcon(
//                         validate: (v) {
//                           if (v!.isEmpty) {
//                             return "please describe the complaint detail";
//                           }
//                           return null;
//                         },
//                         controller: complaintc,
//                         labeltext: "Complaint Detail",
//                         minlinetxtf: 9,
//                       ),
//                       Falconbutton(
//                         onpress: () {
//                           submit(context);
//                           clear();
//                           checkData();
//                           fetchComplaintsList("ali");
//                         },
//                         btn: "Submit",
//                         height1: MediaQuery.of(context).size.height * 0.07,
//                         width1: MediaQuery.of(context).size.width * 0.8,
//                         color1: Colors.blue,
//                         fontweihtbtn: FontWeight.bold,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: complaintsList.length,
//                   itemBuilder: (context, index) {
//                     return Card(
//                       child: ListTile(
//                         title: Text(complaintsList[index]['Title']),
//                         subtitle: Text(complaintsList[index]['Complaint']),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



// Future<void> postData() async {
//   final prefs = await SharedPreferences.getInstance();
//   final houseId = prefs.getInt('houseId');
//   final url =
//       'http://192.168.10.33:80/api/Tenant/Complaint?Date=2023-07-17&Type=1002';
//   final response = await http.post(Uri.parse(url), body: url.toString());
//   print(response.statusCode);
//   print(response.body);
//   Fluttertoast.showToast(msg: "Send Successfully");
// }
