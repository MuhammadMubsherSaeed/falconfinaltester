import 'package:flutter/material.dart';

class Falconbutton extends StatelessWidget {
  const Falconbutton(
      {super.key,
      this.btn,
      this.height1,
      this.width1,
      this.onpress,
      this.color1,
      this.fontsizebtn,
      this.fontweihtbtn,
      this.btncolor});

  final String? btn;
  final double? height1;
  final double? width1;
  final VoidCallback? onpress;
  final Color? color1;
  final double? fontsizebtn;
  final FontWeight? fontweihtbtn;
  final Color? btncolor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onpress,
        child: Container(
          height: height1,
          width: width1,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "$btn",
                style: TextStyle(
                  fontSize: fontsizebtn,
                  fontWeight: fontweihtbtn,
                  color: btncolor,
                ),
              ),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color1,
          ),
        ),
      ),
    );
  }
}
