import 'dart:convert';
import 'package:falconfinaltester/api_connection/dotnet_api_connection.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Custom_widget/falcon_button.dart';
import '../../Custom_widget/text_feild_palcon.dart';
import '../../Custom_widget/text_palcon.dart';

class Complainportal extends StatefulWidget {
  const Complainportal({super.key});

  @override
  State<Complainportal> createState() => _ComplainportalState();
}

TextEditingController complaintTc = TextEditingController();
TextEditingController complaintc = TextEditingController();

Future<void> postData(
    String complaintT, String complaintdet, BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  final houseId = prefs.getInt('houseId');
  final stringhouseid = houseId.toString();
  final url = APIs.sendcomplanit
      .replaceFirst('{complaintT}', complaintT)
      .replaceFirst('{houseId}', stringhouseid)
      .replaceFirst('{complaintdet}', complaintdet);
  // 'http://182.191.69.176:8060/api/Tenant/Complaint?Title=$complaintT&Houseid=$houseId&Complaint=$complaintdet';

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
    //
    print("Error: ${response.statusCode} - ${response.body}");
    Fluttertoast.showToast(msg: "Connection Error: ${response.statusCode}");
  }
}

Future<void> checkData() async {
  final per = await SharedPreferences.getInstance();
  final houseid = per.get('houseId');
  print('thi is houseid $houseid');
}

var formKey = GlobalKey<FormState>();

submit(BuildContext context) async {
  if (formKey.currentState!.validate()) {
    postData(complaintTc.text, complaintc.text, context);
  }
}

void clear() async {
  complaintTc.clear();
  complaintc.clear();
}

class _ComplainportalState extends State<Complainportal> {
  List<Map<String, dynamic>> complaintsList = [];

  Future<List<Map<String, dynamic>>> fetchComplaintsList(String houseId) async {
    final per = await SharedPreferences.getInstance();
    final houseid = per.get('houseId');
    final stringhouseid = houseid.toString();
    print(houseid);
    final url = APIs.showcomplaint.replaceFirst('{houseid}', stringhouseid);

    // 'http://182.191.69.176:8060/api/Tenant/ComplaintsList?Houseid=$houseid';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as List<dynamic>;
      return jsonData.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> fetchData() async {
    try {
      List<Map<String, dynamic>> data = await fetchComplaintsList("ali");
      setState(() {
        complaintsList = data;
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
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
                  textvalue: "Complaint Portal",
                  fontsize1: 30,
                  bold1: FontWeight.bold,
                ),
              ),
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  Textfeildpalcon(
                    validate: (v) {
                      if (v!.isEmpty) {
                        return "please describe the tilte";
                      }
                      return null;
                    },
                    labeltext: "Complaint Title",
                    controller: complaintTc,
                  ),
                  Textfeildpalcon(
                    validate: (v) {
                      if (v!.isEmpty) {
                        return "please describe the compaint Detail";
                      }
                      return null;
                    },
                    controller: complaintc,
                    labeltext: "Complaint Detail",
                    minlinetxtf: 9,
                  ),
                  Falconbutton(
                    onpress: () {
                      submit(context);
                      clear();
                      checkData();
                      fetchComplaintsList("ali");
                    },
                    btn: "Submit",
                    height1: 50,
                    width1: 250,
                    color1: Colors.blue,
                    fontweihtbtn: FontWeight.bold,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
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
            ),
          ],
        ),
      ),
    );
  }
}

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
