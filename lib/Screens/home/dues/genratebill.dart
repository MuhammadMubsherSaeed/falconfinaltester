// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// class GenrateBill extends StatefulWidget {
//   const GenrateBill({super.key});

//   @override
//   State<GenrateBill> createState() => _GenrateBillState();
// }

// class _GenrateBillState extends State<GenrateBill> {
//   final String url =
//       'http://192.168.10.121/printbillpg.aspx?Date=2023-07-17&Type=1002';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SizedBox(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         child: InAppWebView(
//           initialUrlRequest: URLRequest(url: Uri.parse(url)),
//           initialOptions: InAppWebViewGroupOptions(
//             android: AndroidInAppWebViewOptions(
//               builtInZoomControls: false, // Disable built-in zoom controls
//               displayZoomControls: false, // Hide the zoom controls
//               initialScale: 170, // Set initial zoom scale to 200% (2x)
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class GenrateBill extends StatelessWidget {
  const GenrateBill({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Under Processing...",
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
