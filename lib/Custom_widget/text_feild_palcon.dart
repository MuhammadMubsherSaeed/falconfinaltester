import 'package:flutter/material.dart';

class Textfeildpalcon extends StatelessWidget {
  const Textfeildpalcon({
    super.key,
    this.labeltext,
    this.maxlinetxtf,
    this.minlinetxtf,
    this.textinputtypetxtbtn,
    this.controller,
    this.icon,
    this.validate,
    this.hintext,
    this.icons,
    this.onpress,
    this.ispassword = false,
    this.obscureText = false, // Add this line with a default value
    this.suffixIcon,
    // Add this line
  });
  final TextEditingController? controller;

  final String? labeltext;
  final int? maxlinetxtf;
  final int? minlinetxtf;
  final TextInputType? textinputtypetxtbtn;
  final Widget? icon;
  final String? hintext;
  final String? Function(String?)? validate;
  final VoidCallback? onpress;
  final IconData? icons;
  final bool obscureText; // Add this line
  final Widget? suffixIcon;

  final bool ispassword;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: TextFormField(
          validator: validate,
          maxLines: maxlinetxtf,
          minLines: minlinetxtf,
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: IconButton(onPressed: onpress, icon: Icon(icons)),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: Colors.red,
                width: 3.0, // Border color when there's an error
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 83, 53, 7),
                  width:
                      3.0 // Border color when the field is focused and there's an error
                  ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.green, width: 3.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.blue, width: 3.0),
            ),
            labelText: labeltext,
            hintText: hintext,
          ),
          obscureText: ispassword,
        ),
      ),
    );
  }
}
