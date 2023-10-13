// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// class WebViews extends StatefulWidget {
//   const WebViews({super.key});

//   @override
//   State<WebViews> createState() => _WebViewsState();
// }

// class _WebViewsState extends State<WebViews> {
//   final String url =
//       'http://192.168.10.121/printbillpg.aspx?Date=2023-07-17&Type=1002';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Web Page'),
//       ),
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