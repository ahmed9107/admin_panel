import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final double width;
  const CustomButton({
    Key? key,
    required this.text, this.onPressed, this.width = double.maxFinite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(
          top: 10,
          left: 15,
          right:15
        ),
        width: width,
        height: 50,
        //padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(5)
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Theme.of(context).scaffoldBackgroundColor,
              fontWeight: FontWeight.bold,
              fontSize: 16.0),),
        ),
      ),
    );
  }
}
