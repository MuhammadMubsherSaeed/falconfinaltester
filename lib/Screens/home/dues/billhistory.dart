import 'dart:convert';
import 'package:falconfinaltester/api_connection/dotnet_api_connection.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BillHistory extends StatefulWidget {
  const BillHistory({super.key});

  @override
  State<BillHistory> createState() => _BillHistoryState();
}

class _BillHistoryState extends State<BillHistory> {
  List<Map<String, dynamic>> complaintsList = [];
  Future<List<Map<String, dynamic>>> fetchComplaintsList() async {
    final per = await SharedPreferences.getInstance();
    final houseid = per.get('houseId');
    final stringhousid = houseid.toString();
    print(houseid);
    final url = APIs.billhistory.replaceFirst('{houseid}', stringhousid);
    // 'http://182.191.69.176:8060/api/Tenant/GetBillsByHouseId?Houseid=1012';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as List<dynamic>;
      print(response.body);
      return jsonData.cast<
          Map<String,
              dynamic>>(); // Convert List<dynamic> to List<Map<String, dynamic>>
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> fetchData() async {
    try {
      List<Map<String, dynamic>> data = await fetchComplaintsList();
      setState(() {
        complaintsList = data;

        print(complaintsList);
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pay By Card'),
          content: Text(
            'You can use this facility in future',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Bill Month",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Due Date & Amount",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Status",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: complaintsList.length,
              itemBuilder: (context, index) {
                int payable = complaintsList[index]['Payable'];
                String payableString = payable.toString();
                String dateTimeString = "2023-03-10T00:00:00";
                String datePart = dateTimeString.substring(0, 10);
                return Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Text(complaintsList[index]['BillingMonth']),
                        title: Text(datePart),
                        subtitle: Text(payableString),
                        trailing: Text(
                          complaintsList[index]['Status'],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _showDialog(context);
                        },
                        child: Container(
                          height: 40,
                          width: 150,
                          child: Center(
                            child: Text(
                              "Pay By Card",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
