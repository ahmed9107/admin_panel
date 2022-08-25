import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey,
        ),
        height: 80.0,
      ),
    );
  }
}