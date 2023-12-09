// import 'package:falconfinaltester/Screens/home/building_altration.dart';
// import 'package:falconfinaltester/Screens/home/complain_portal.dart';
// import 'package:falconfinaltester/Screens/home/dues/duesportal.dart';
// import 'package:falconfinaltester/Screens/home/home_page.dart';
// import 'package:falconfinaltester/Screens/home/pet_reg.dart';
// import 'package:falconfinaltester/Screens/home/visitorcard/visitor_card.dart';
// import 'package:falconfinaltester/api_connection/dotnet_api_connection.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../Custom_widget/falcon_button.dart';
// import '../../Custom_widget/text_feild_palcon.dart';
// import '../../Custom_widget/text_palcon.dart';
// import 'package:http/http.dart' as http;

// class Etag extends StatefulWidget {
//   const Etag({Key? key});

//   @override
//   State<Etag> createState() => _EtagState();
// }

// var formkey = GlobalKey<FormState>();
// TextEditingController makec = TextEditingController();
// TextEditingController colorc = TextEditingController();
// TextEditingController regNoc = TextEditingController();
// TextEditingController modelNoc = TextEditingController();
// TextEditingController vehicleTypec = TextEditingController();

// final List<int> yearsList =
//     List.generate(30, (index) => DateTime.now().year - 29 + index);
// String? selectedYear = '2023'; // Store the selected year

// Future<void> postData(String make, String color, String regno, String modelNo,
//     String vehicleType, BuildContext context) async {
//   final prefs = await SharedPreferences.getInstance();
//   final houseId = prefs.getInt('houseId');
//   final stringhouseid = houseId.toString();
//   final url = APIs.etag
//       .replaceFirst('{make}', make)
//       .replaceFirst('{color}', color)
//       .replaceFirst('{regno}', regno)
//       .replaceFirst('{houseId}', stringhouseid)
//       .replaceFirst('{modelNo}', modelNo)
//       .replaceFirst('{vehicleType}', vehicleType);

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
//   Navigator.pop(context);

//   print(response.body);
//   print(response.statusCode);

//   if (response.statusCode == 200) {
//     Fluttertoast.showToast(msg: "Sent Successfully");
//   } else {
//     Fluttertoast.showToast(msg: "Connection Error");
//   }
// }

// submit(BuildContext context) async {
//   if (formkey.currentState!.validate()) {
//     postData(makec.text, colorc.text, regNoc.text, selectedYear.toString(),
//         vehicleTypec.text, context);
//   }
// }

// void clear() async {
//   makec.clear();
//   colorc.clear();
//   regNoc.clear();
//   vehicleTypec.clear();
// }

// class _EtagState extends State<Etag> {
//   int _selectedIndex = 3;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Material(
//         child: SafeArea(
//           child: Container(
//             child: Form(
//               key: formkey,
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.03,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(
//                         MediaQuery.of(context).size.width * 0.05),
//                     child: Container(
//                       width: double.infinity,
//                       height: MediaQuery.of(context).size.height * 0.08,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Falcontext(
//                         textvalue: "E-TAG Registration",
//                         fontsize1: 30,
//                         bold1: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   Textfeildpalcon(
//                     controller: regNoc,
//                     labeltext: "Registration Number",
//                     minlinetxtf: 1,
//                     validate: (v) {
//                       if (v!.isEmpty) {
//                         return "Please Fill The Field";
//                       }
//                       return null;
//                     },
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(
//                         MediaQuery.of(context).size.width * 0.05),
//                     child: InputDecorator(
//                       decoration: InputDecoration(
//                         labelText: 'Model Year',
//                         enabledBorder: OutlineInputBorder(
//                           borderSide:
//                               BorderSide(color: Colors.green, width: 3.0),
//                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide:
//                               BorderSide(color: Colors.blue, width: 2.0),
//                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                         ),
//                       ),
//                       child: DropdownButton<String>(
//                         value: selectedYear,
//                         items: yearsList.map((year) {
//                           return DropdownMenuItem<String>(
//                             value: year.toString(),
//                             child: Text(year.toString()),
//                           );
//                         }).toList(),
//                         onChanged: (year) {
//                           setState(() {
//                             selectedYear = year;
//                           });
//                         },
//                       ),
//                     ),
//                   ),
//                   Textfeildpalcon(
//                     controller: makec,
//                     maxlinetxtf: 1,
//                     labeltext: "Make",
//                     validate: (v) {
//                       if (v!.isEmpty) {
//                         return "Please Fill The Field";
//                       }
//                       return null;
//                     },
//                   ),
//                   Textfeildpalcon(
//                     controller: vehicleTypec,
//                     labeltext: "Vehicle Type",
//                     minlinetxtf: 1,
//                     validate: (v) {
//                       if (v!.isEmpty) {
//                         return "Please Fill The Field";
//                       }
//                       return null;
//                     },
//                   ),
//                   Textfeildpalcon(
//                     controller: colorc,
//                     maxlinetxtf: 1,
//                     labeltext: "Vehicle Color",
//                     validate: (v) {
//                       if (v!.isEmpty) {
//                         return "Please Fill The Field";
//                       }
//                       return null;
//                     },
//                   ),
//                   Falconbutton(
//                     btn: "Apply For E-TAG Registration",
//                     height1: MediaQuery.of(context).size.height * 0.07,
//                     width1: MediaQuery.of(context).size.width * 0.7,
//                     color1: Colors.blue,
//                     fontweihtbtn: FontWeight.bold,
//                     onpress: () {
//                       submit(context);
//                       clear();
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           bottomNavigationBar: BottomNavigationBar(
//             backgroundColor:
//                 Color.fromARGB(255, 71, 156, 240), // Set the background color
//             unselectedItemColor: Colors.grey, // Set the background color
//             items: const <BottomNavigationBarItem>[
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.comment),
//                 label: 'Complaints',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.money_outlined),
//                 label: 'Dues & Fines',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.car_crash_sharp),
//                 label: 'E-TAG Registration',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.door_back_door_outlined),
//                 label: 'Card Issuance',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.pets),
//                 label: 'Pets Registration',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.house_rounded),
//                 label: 'Building Alterations',
//               ),
//             ],
//             currentIndex: _selectedIndex,
//             selectedItemColor: Color.fromARGB(255, 11, 162, 34),
//             onTap: _onItemTapped,
//           ),
//         ),
//       ),
//     );
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });

//     // Handle navigation based on the index (0, 1, 2, etc.)
//     switch (index) {
//       case 0:
//         // Navigate to the first screen (Complaint Portal)
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => Homescreen()),
//         );
//         break;
//       case 1:
//         // Navigate to the second screen (Dues and Fines)
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => Complainportal()),
//         );
//         break;
//       case 2:
//         // Navigate to the second screen (Dues and Fines)
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => DuesandBillPortal()),
//         );
//         break;
//       case 3:
//         // Navigate to the second screen (Dues and Fines)
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => Etag()),
//         );
//         break;
//       case 4:
//         // Navigate to the second screen (Dues and Fines)
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => VisitorCard()),
//         );
//         break;
//       case 5:
//         // Navigate to the second screen (Dues and Fines)
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => Petreg()),
//         );
//         break;
//       case 6:
//         // Navigate to the second screen (Dues and Fines)
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => Buildingalteration()),
//         );
//         break;
//       // Add cases for other screens as needed
//     }
//   }
// }

import 'package:falconfinaltester/Screens/home/building_altration.dart';
import 'package:falconfinaltester/Screens/home/complain_portal.dart';
import 'package:falconfinaltester/Screens/home/dues/duesportal.dart';
import 'package:falconfinaltester/Screens/home/home_page.dart';
import 'package:falconfinaltester/Screens/home/pet_reg.dart';
import 'package:falconfinaltester/Screens/home/visitorcard/visitor_card.dart';
import 'package:falconfinaltester/api_connection/dotnet_api_connection.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Custom_widget/falcon_button.dart';
import '../../Custom_widget/text_feild_palcon.dart';
//import '../../Custom_widget/text_palcon.dart';
// import 'building_altration.dart';
import 'package:http/http.dart' as http;

class Etag extends StatefulWidget {
  const Etag({super.key});

  @override
  State<Etag> createState() => _EtagState();
}

var formkey = GlobalKey<FormState>();
TextEditingController makec = TextEditingController();
TextEditingController colorc = TextEditingController();
TextEditingController regNoc = TextEditingController();
TextEditingController modelNoc = TextEditingController();
TextEditingController vehicleTypec = TextEditingController();

final List<int> yearsList =
    List.generate(30, (index) => DateTime.now().year - 29 + index);
String? selectedYear = '2023'; // Store the selected year

Future<void> postData(String make, String color, String regno, String modelNo,
    String vehicleType, BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  final houseId = prefs.getInt('houseId');
  final stringhouseid = houseId.toString();
  final url = APIs.etag
      .replaceFirst('{make}', make)
      .replaceFirst('{color}', color)
      .replaceFirst('{regno}', regno)
      .replaceFirst('{houseId}', stringhouseid)
      .replaceFirst('{modelNo}', modelNo)
      .replaceFirst('{vehicleType}', vehicleType);
  // 'http://182.191.69.176:8060/api/Tenant/ETagRegistration?Make=$make&Color=$color&RegNo=$regno&Houseid=$houseId&ModelNo=$modelNo&VehicleType=$vehicleType';
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
  print(response.body);
  print(response.statusCode);
  Navigator.pop(context);
  if (response.statusCode == 200) {
    Fluttertoast.showToast(msg: "Sent Successfully");
  } else {
    Fluttertoast.showToast(msg: "Connection Error");
  }
}

Future<void> checkData() async {
  final per = await SharedPreferences.getInstance();
  final houseid = per.get('houseId');
  print('thi is houseid $houseid');
}

submit(BuildContext context) async {
  if (formkey.currentState!.validate()) {
    postData(makec.text, colorc.text, regNoc.text, selectedYear.toString(),
        vehicleTypec.text, context);
  }
}

void clear() async {
  makec.clear();
  colorc.clear();
  regNoc.clear();
  // selectedYear = null;
  vehicleTypec.clear();
}

class _EtagState extends State<Etag> {
  int _selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('E-TAG Registration'),
          centerTitle: true,
        ),
        body: Container(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Container(
                //     width: double.infinity,
                //     height: 50,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(12),
                //     ),
                //     child: Falcontext(
                //       textvalue: "E-TAG Registration",
                //       fontsize1: 30,
                //       bold1: FontWeight.bold,
                //     ),
                //   ),
                // ),
                Textfeildpalcon(
                  controller: regNoc,
                  labeltext: "Registration Number",
                  minlinetxtf: 1,
                  validate: (v) {
                    if (v!.isEmpty) {
                      return "please Fill The Feild";
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Model Year',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 3.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    child: DropdownButton<String>(
                      value: selectedYear,
                      items: yearsList.map((year) {
                        return DropdownMenuItem<String>(
                          value: year.toString(),
                          child: Text(year.toString()),
                        );
                      }).toList(),
                      onChanged: (year) {
                        setState(() {
                          selectedYear = year;
                        });
                      },
                    ),
                  ),
                ),
                Textfeildpalcon(
                  controller: makec,
                  maxlinetxtf: 1,
                  labeltext: "Make",
                  validate: (v) {
                    if (v!.isEmpty) {
                      return "please fill the feild";
                    }
                    return null;
                  },
                ),
                Textfeildpalcon(
                  controller: vehicleTypec,
                  labeltext: "Vehicle Type ",
                  minlinetxtf: 1,
                  validate: (v) {
                    if (v!.isEmpty) {
                      return "Please Fill The Feild";
                    }
                    return null;
                  },
                ),
                Textfeildpalcon(
                  controller: colorc,
                  maxlinetxtf: 1,
                  labeltext: "Vehicle Color",
                  validate: (v) {
                    if (v!.isEmpty) {
                      return "Please fill the feild";
                    }
                    return null;
                  },
                ),
                Falconbutton(
                  btn: "Apply For E-TAG Registation",
                  height1: 50,
                  width1: 250,
                  color1: Colors.blue,
                  fontweihtbtn: FontWeight.bold,
                  onpress: () {
                    submit(context);
                    clear();
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 71, 156, 240),
          unselectedItemColor: Colors.grey,
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
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Homescreen()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Complainportal()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => DuesandBillPortal()),
        );
        break;
      case 3:
        // The current screen (E-TAG Registration) is already selected
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => VisitorCard()),
        );
        break;
      case 5:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Petreg()),
        );
        break;
      case 6:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Buildingalteration()),
        );
        break;
    }
  }
}
