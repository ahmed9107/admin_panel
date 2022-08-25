import 'package:flutter/material.dart';

class OnHoverButton extends StatefulWidget {
  final Widget child;
  const OnHoverButton({Key? key, required this.child}) : super(key: key);

  @override
  State<OnHoverButton> createState() => _OnHoverButtonState();
}

class _OnHoverButtonState extends State<OnHoverButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    final hoverTransform = Matrix4.identity()..scale(1);
    final transform = isHovered ? hoverTransform : Matrix4.identity();
    return Container(
      //height: 55,
      color: isHovered ? Theme.of(context).scaffoldBackgroundColor : null,
      child: MouseRegion(
        onEnter: (event)=> onEntered(true),
        onExit: (event)=> onEntered(false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: transform,
          child: widget.child
        )
      )
    );
  }

  void onEntered(bool isHover) => setState(() {
    isHovered = isHover;
  });
}