import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatContainer extends StatelessWidget {
  final String text;
  final bool isCustomer;
  const ChatContainer({Key? key, required this.text, required this.isCustomer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isCustomer ? AlignmentDirectional.centerEnd : AlignmentDirectional.centerStart,
      child: Container(
        margin: EdgeInsets.only(
          bottom: 10,
          right: isCustomer ? 0.0 : 120,
          left: isCustomer ? 120 : 0.0,
        ),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isCustomer ? Theme.of(context).primaryColor : Theme.of(context).backgroundColor,
          borderRadius: BorderRadiusDirectional.only(
            topEnd: const Radius.circular(10),
            topStart: const Radius.circular(10),
            bottomStart: isCustomer ? const Radius.circular(10) : Radius.zero,
            bottomEnd: isCustomer ? Radius.zero : const Radius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.roboto(
            fontSize: 16.0,
            color: isCustomer
              ? Theme.of(context).scaffoldBackgroundColor
              : Theme.of(context).primaryColorLight
          ),
        ),
      ),
    );
  }
}