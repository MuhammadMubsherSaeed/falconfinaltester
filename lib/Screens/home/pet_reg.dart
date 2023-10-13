// import 'package:falconfinaltester/api_connection/dotnet_api_connection.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../Custom_widget/falcon_button.dart';
// import '../../Custom_widget/text_feild_palcon.dart';
// import '../../Custom_widget/text_palcon.dart';
// import 'building_altration.dart';
// import 'package:http/http.dart' as http;

// class Petreg extends StatefulWidget {
//   const Petreg({super.key});

//   @override
//   State<Petreg> createState() => _PetregState();
// }

// TextEditingController petkindc = TextEditingController();
// TextEditingController vaccinationnamec = TextEditingController();
// TextEditingController vaccinationvalidtillc = TextEditingController();

// Future<void> postData(String petkind, String vaccinationname,
//     String vaccinationvalidtill, BuildContext context) async {
//   final prefs = await SharedPreferences.getInstance();
//   final houseId = prefs.getInt('houseId');
//   final stringhouseid = houseId.toString();
//   // String viic = "2023-07-21T06:54:56.851Z";
//   // DateTime stringdate = DateTime.parse(viic);
//   final url = APIs.petreg
//       .replaceFirst('{houseId}', stringhouseid)
//       .replaceFirst('{petkind}', petkind)
//       .replaceFirst('{vaccinationvalidtill}', vaccinationvalidtill)
//       .replaceFirst('{vaccinationname}', vaccinationname);
//   // 'http://182.191.69.176:8060/api/Tenant/PetRegistration?HouseId=$houseId&PetKind=$petkind&Vaccinated_Due=$vaccinationvalidtill&Vaccinated=$vaccinationname';
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
//     Fluttertoast.showToast(msg: "Connection Error");
//   }
// }

// Future<void> checkData() async {
//   final per = await SharedPreferences.getInstance();
//   final houseid = per.get('houseId');
//   print('thi is houseid $houseid');
// }

// var formKey = GlobalKey<FormState>();

// submit(BuildContext context) async {
//   if (formkey.currentState!.validate()) {
//     postData(
//       petkindc.text,
//       vaccinationnamec.text,
//       vaccinationvalidtillc.text,
//       context,
//     );
//   }
// }

// void clear() async {
//   petkindc.clear();
//   vaccinationnamec.clear();
//   vaccinationvalidtillc.clear();
// }

// class _PetregState extends State<Petreg> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Material(
//         child: Container(
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
//                     textvalue: "Pet Registration",
//                     fontsize1: 30,
//                     bold1: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Form(
//                 key: formkey,
//                 child: Column(
//                   children: [
//                     Textfeildpalcon(
//                       validate: (v) {
//                         if (v!.isEmpty) {
//                           return "Please Fill The Feild";
//                         }
//                         return null;
//                       },
//                       controller: petkindc,
//                       maxlinetxtf: 1,
//                       labeltext: "Enter Pet Kind",
//                     ),
//                     Textfeildpalcon(
//                       validate: (v) {
//                         if (v!.isEmpty) {
//                           return "Please Fill The Feild";
//                         }
//                         return null;
//                       },
//                       controller: vaccinationnamec,
//                       maxlinetxtf: 1,
//                       labeltext: "Vaccination Name",
//                     ),
//                     Textfeildpalcon(
//                       validate: (v) {
//                         if (v!.isEmpty) {
//                           return "Valid Till";
//                         }
//                         return null;
//                       },
//                       controller: vaccinationvalidtillc,
//                       maxlinetxtf: 1,
//                       labeltext: "Vaccination Valid Till",
//                     ),
//                   ],
//                 ),
//               ),
//               Falconbutton(
//                 btn: "Apply For Pet Registraion",
//                 height1: 50,
//                 width1: 250,
//                 color1: Colors.blue,
//                 fontweihtbtn: FontWeight.bold,
//                 onpress: () {
//                   submit(context);
//                   clear();
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class Petreg extends StatelessWidget {
  const Petreg({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Under Pocessing...",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
