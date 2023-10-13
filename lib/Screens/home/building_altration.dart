import 'package:falconfinaltester/api_connection/dotnet_api_connection.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Custom_widget/falcon_button.dart';
import '../../Custom_widget/text_feild_palcon.dart';
import '../../Custom_widget/text_palcon.dart';

class Buildingalteration extends StatefulWidget {
  const Buildingalteration({super.key});

  @override
  State<Buildingalteration> createState() => _BuildingalterationState();
}

var formkey = GlobalKey<FormState>();

submit() async {
  if (formkey.currentState!.validate()) {}
}

// enum Building { commercial, noncommertial }

class _BuildingalterationState extends State<Buildingalteration> {
  TextEditingController titlec = TextEditingController();
  TextEditingController detailc = TextEditingController();

  Future<void> postData(
      String title, String detail, BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();

    final houseId = prefs.getInt('houseId');
    final stringhouseId = houseId.toString();
    final url =
        // 'http://182.191.69.176:8060/api/Tenant/AlterationReq?Title=$title&Detail=$detail&HouseId=$houseId';
        APIs.buildingalter
            .replaceFirst('{title}', title)
            .replaceFirst('{detail}', detail)
            .replaceFirst('{housid}', stringhouseId);

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
      Fluttertoast.showToast(msg: "Connection Error");
    }
  }

  var formkey = GlobalKey<FormState>();

  submit(BuildContext context) async {
    if (formkey.currentState!.validate()) {
      postData("this is title", detailc.text, context);
    }
  }

  void clear() async {
    // titlec.clear();
    detailc.clear();
  }

  // Building _building = Building.commercial;
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
                    child: SafeArea(
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Falcontext(
                          textvalue: "Building Alteration",
                          fontsize1: 30,
                          bold1: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // Text(
                  //   "Select Building Type",
                  //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     Container(
                  //       child: Row(
                  //         children: [
                  //           Radio(
                  //               value: Building.commercial,
                  //               groupValue: _building,
                  //               onChanged: (building) {
                  //                 setState(() {
                  //                   _building = building!;
                  //                 });
                  //               }),
                  //           Text(
                  //             "Commercial",
                  //             style: TextStyle(
                  //                 fontSize: 15, fontWeight: FontWeight.bold),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Container(
                  //       child: Row(
                  //         children: [
                  //           Radio(
                  //             value: Building.noncommertial,
                  //             groupValue: _building,
                  //             onChanged: (building) {
                  //               setState(() {
                  //                 _building = building!;
                  //               });
                  //             },
                  //           ),
                  //           Text(
                  //             "Non-Commercial",
                  //             style: TextStyle(
                  //                 fontSize: 15, fontWeight: FontWeight.bold),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Textfeildpalcon(
                    validate: (v) {
                      if (v!.isEmpty) {
                        return "Please Fill The Feild";
                      }
                      return null;
                    },
                    controller: titlec,
                    maxlinetxtf: 1,
                    labeltext: "Tilte",
                  ),
                  Textfeildpalcon(
                    validate: (v) {
                      if (v!.isEmpty) {
                        return "Please Fill The Feild";
                      }
                      return null;
                    },
                    controller: detailc,
                    maxlinetxtf: 9,
                    minlinetxtf: 1,
                    labeltext:
                        "Describe The Complete Renovation Of The Building.",
                  ),
                  // Textfeildpalcon(
                  //   validate: (v) {
                  //     if (v!.isEmpty) {
                  //       return "Please Enter Changes";
                  //     }
                  //     return null;
                  //   },
                  //   controller: detailc,
                  //   labeltext: "Add the changes",
                  //   minlinetxtf: 1,
                  //   maxlinetxtf: 9,
                  // ),
                  Falconbutton(
                    btn: "Upload Approved Documents",
                    height1: 200,
                    width1: 300,
                    color1: Colors.brown,
                    onpress: () {},
                  ),
                  Falconbutton(
                    btn: "Apply For Building Altration",
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
        ),
      ),
    );
  }
}
