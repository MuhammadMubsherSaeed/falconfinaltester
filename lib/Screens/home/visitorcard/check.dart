// import 'package:flutter/material.dart';

// class Check extends StatefulWidget {
//   const Check({super.key});

//   @override
//   State<Check> createState() => _CheckState();
// }

// enum Building { owner, tanent }

// Building _building = Building.owner;
// TextEditingController _radioValueController = TextEditingController();

// class _CheckState extends State<Check> {
//   @override
//   void initState() {
//     super.initState();
//     _radioValueController.text;
//     // =
//     //     _building == Building.owner ? "owner" : "tanent";
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Column(
//       children: [
//         Radio(
//           value: Building.owner,
//           groupValue: _building,
//           onChanged: (value) {
//             setState(() {
//               _building = value as Building;
//               _radioValueController.text = "owner";
//             });
//           },
//         ),
//         Radio(
//           value: Building.tanent,
//           groupValue: _building,
//           onChanged: (value) {
//             setState(() {
//               _building = value as Building;
//               _radioValueController.text = "Tanent";
//             });
//           },
//         ),
//         Text(_radioValueController.text),
//       ],
//     ));
//   }
// }
