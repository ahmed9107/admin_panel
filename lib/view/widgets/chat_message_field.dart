import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatMessageField extends StatelessWidget {
  final TextInputType type;
  final TextEditingController controller;
  final bool obscure;
  final bool readOnly;
  final bool enable;
  final bool autoFocus;
  final int maxLines;
  final Color bgColor;
  final double height;
  final String? Function(String?)? onSubmit;
  final String? Function(String?)? onChange;
  final Function()? ontap;
  final String? title;
  final String? hint;
  final IconData? suffixIcon;
  final Function()? showPass;
  final String? Function(String?)? validate;

  const ChatMessageField(
      {Key? key,
      required this.type,
      required this.controller,
      this.obscure = false,
      this.readOnly = false,
      this.enable = true,
      this.autoFocus = false,
      this.height = 50,
      this.maxLines = 1,
      this.onSubmit,
      this.onChange,
      this.ontap,
      this.title,
      this.hint,
      this.validate,
      this.suffixIcon,
      this.showPass,
      this.bgColor = Colors.grey
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        //bottom: 25,
        left: 10,
        right:10
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title == null
            ? Container()
            : Text(title!,
                style: GoogleFonts.roboto(
                  color: Theme.of(context).primaryColorLight, fontSize: 16)),
          Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.only(right: 15, left: 15),
            height: height == 50 ? 50*1.1 : height,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(10)
            ),
            alignment: Alignment.center,
            child: TextFormField(
              autofocus: autoFocus,
              //cursorColor: Theme.of(context).primaryColor,
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                  fontWeight: FontWeight.w500,
                  fontSize: 16)),
              //maxLines: 10,
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
                errorStyle: const TextStyle(height: 0),
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: hint,
                hintStyle: GoogleFonts.roboto(textStyle: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                )),
                suffixIcon: InkWell(
                  onTap: showPass,
                  child: Icon(suffixIcon)),
              ),
              validator: validate,
            ),
          ),
        ],
      ),
    );
  }
}
