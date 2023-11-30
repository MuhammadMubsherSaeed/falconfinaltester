import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import path_provider

class GenerateBill extends StatefulWidget {
  const GenerateBill({Key? key});

  @override
  State<GenerateBill> createState() => _GenerateBillState();
}

class _GenerateBillState extends State<GenerateBill> {
  late DateTime selectedDate = DateTime.now();
  Uint8List? pdfBytes;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        pdfBytes = null;
      });
    }
  }

  Future<void> _generateAndDisplayBill(DateTime selectedDate) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final houseId = prefs.getInt('houseId');
      // final stringhouseid = houseId.toString();
      final response = await http.get(
        Uri.parse(
          'http://182.180.146.190:8060/api/Tenant/GetMonthlyBillByID?HouseId=$houseId&DateTime=${DateFormat('yyyy-MM-dd').format(selectedDate)}',
        ),
      );

      if (response.statusCode == 200) {
        pdfBytes = response.bodyBytes;
      } else {
        print('Failed to fetch API: ${response.statusCode}');
      }

      setState(() {});
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> _downloadPDF() async {
    if (pdfBytes != null) {
      try {
        final tempDir = await getTemporaryDirectory();
        final file = File('${tempDir.path}/generated_bill.pdf');
        await file.writeAsBytes(pdfBytes!);

        // Display a snackbar to indicate the download
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('PDF downloaded to local storage'),
          ),
        );
      } catch (error) {
        print('Error downloading PDF: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generate Bill'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20),
          Text(
            'Selected Date: ${DateFormat('yyyy-MM-dd').format(selectedDate)}',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _selectDate(context),
            child: Text('Select Month'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              await _generateAndDisplayBill(selectedDate);
            },
            child: Text('Generate Bill'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _downloadPDF(),
            child: Text('Download PDF'),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              child: pdfBytes != null
                  ? PDFView(
                      pdfData: pdfBytes!,
                      autoSpacing: false,
                      pageFling: false,
                      pageSnap: true,
                      fitPolicy: FitPolicy.BOTH,
                    )
                  : Center(
                      child: Text(
                        'PDF View Here',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}











// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'dart:typed_data'; // Import the typed_data library

// class GenerateBill extends StatefulWidget {
//   const GenerateBill({Key? key});

//   @override
//   State<GenerateBill> createState() => _GenerateBillState();
// }

// class _GenerateBillState extends State<GenerateBill> {
//   late DateTime selectedDate = DateTime.now();
//   Uint8List? pdfBytes; // Use Uint8List? for pdfBytes

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );

//     if (picked != null && picked != selectedDate) {
//       setState(() {
//         selectedDate = picked;
//         pdfBytes = null; // Reset PDF bytes when the date changes
//       });
//     }
//   }

//   Future<void> _generateAndDisplayBill(DateTime selectedDate) async {
//     try {
//       // Make an HTTP GET request to the API
//       final response = await http.get(
//         Uri.parse(
//           'http://182.180.146.190:8060/api/Tenant/GetMonthlyBillByID?HouseId=7008&DateTime=${DateFormat('yyyy-MM-dd').format(selectedDate)}',
//         ),
//       );

//       // Check if the request was successful
//       if (response.statusCode == 200) {
//         // Convert the response body (PDF content) to Uint8List
//         pdfBytes = response.bodyBytes;
//       } else {
//         // Handle error if the API request fails
//         print('Failed to fetch API: ${response.statusCode}');
//         // You can set an error message or handle it as needed
//       }
//       // Trigger a rebuild to show the PDF view
//       setState(() {});
//     } catch (error) {
//       // Handle exceptions
//       print('Error: $error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Generate Bill'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           SizedBox(height: 20),
//           Text(
//             'Selected Date: ${DateFormat('yyyy-MM-dd').format(selectedDate)}',
//             style: TextStyle(fontSize: 20),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () => _selectDate(context),
//             child: Text('Select Date'),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () async {
//               // Call the function to generate and display the bill
//               await _generateAndDisplayBill(selectedDate);
//             },
//             child: Text('Generate Bill'),
//           ),
//           SizedBox(height: 20),
//           Expanded(
//             child: Container(
//               // Display the PDF view
//               child: pdfBytes != null
//                   ? PDFView(
//                       pdfData: pdfBytes!,
//                       autoSpacing: false,
//                       pageFling: false,
//                       pageSnap: true,
//                       fitPolicy: FitPolicy.BOTH,
//                     )
//                   : Center(
//                       child: Text(
//                         'PDF View Here',
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// }
// import 'package:flutter/material.dart';

// class GenrateBill extends StatelessWidget {
//   const GenrateBill({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text(
//           "Under Processing...",
//           style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }
//}
