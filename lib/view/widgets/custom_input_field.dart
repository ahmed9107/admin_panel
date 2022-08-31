import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInputField extends StatelessWidget {
  final TextInputType type;
  final TextEditingController controller;
  final bool obscure;
  final bool readOnly;
  final bool enable;
  final bool autoFocus;
  final int maxLines;
  final Color bgColor;
  //final double height;
  final String? Function(String?)? onSubmit;
  final String? Function(String?)? onChange;
  final Function()? ontap;
  final String title;
  final String? hint;
  final IconData? suffixIcon;
  final Function()? showPass;
  final String? Function(String?)? validate;

  const CustomInputField(
      {Key? key,
      required this.type,
      required this.controller,
      this.obscure = false,
      this.readOnly = false,
      this.enable = true,
      this.autoFocus = false,
      //this.height = 50,
      this.maxLines = 1,
      this.onSubmit,
      this.onChange,
      this.ontap,
      required this.title,
      this.hint,
      this.validate,
      this.suffixIcon,
      this.showPass,
      this.bgColor = Colors.grey
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        //bottom: 25,
        left: 15,
        right:15
      ),
      child: TextFormField(
        autofocus: autoFocus,
        style: GoogleFonts.roboto(
          textStyle: TextStyle(
            color: Theme.of(context).primaryColorLight,
            fontWeight: FontWeight.w500,
            fontSize: 16)),
        keyboardType: type,
        maxLines: maxLines,
        controller: controller,
        obscureText: obscure,
        readOnly: readOnly,
        enabled: enable,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        onTap: ontap,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hint,
          hintStyle: GoogleFonts.roboto(textStyle: TextStyle(
            color: Colors.grey[700],
            fontWeight: FontWeight.w400,
            fontSize: 14,
          )),
          contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 9),
            child: Text(title)),
          labelStyle: GoogleFonts.roboto(textStyle: TextStyle(
            color: Colors.grey[700],
            fontWeight: FontWeight.w400
          )),
          suffixIcon: InkWell(
            onTap: showPass,
            child: Icon(suffixIcon)),
        ),
        validator: validate,
      ),
    );
  }
}
