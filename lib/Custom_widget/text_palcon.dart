import 'package:flutter/material.dart';

class Falcontext extends StatelessWidget {
  const Falcontext(
      {super.key, this.textvalue, this.fontsize1, this.bold1,});

  final String? textvalue;
  final double? fontsize1;
  final FontWeight? bold1;
 

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "$textvalue",
          style: TextStyle(
            fontSize: fontsize1,
            fontWeight: bold1,
          ),
        ),
      ),
    );
  }
}
