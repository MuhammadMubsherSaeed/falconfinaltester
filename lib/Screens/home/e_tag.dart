import 'package:falconfinaltester/api_connection/dotnet_api_connection.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Custom_widget/falcon_button.dart';
import '../../Custom_widget/text_feild_palcon.dart';
import '../../Custom_widget/text_palcon.dart';
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: SafeArea(
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
                        textvalue: "E-TAG Registration",
                        fontsize1: 30,
                        bold1: FontWeight.bold,
                      ),
                    ),
                  ),
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
                  // Textfeildpalcon(
                  //   controller: modelNoc,
                  //   labeltext: "Model Year",
                  //   minlinetxtf: 1,
                  //   validate: (v) {
                  //     if (v!.isEmpty) {
                  //       return "Please Fill The Feild";
                  //     }
                  //     return null;
                  //   },
                  // ),
                  // Year selection dropdown
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'Model Year',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.green, width: 3.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      // Your input widget here
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
        ),
      ),
    );
  }
}
