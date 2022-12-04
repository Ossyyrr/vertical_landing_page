import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CustomMenuItem extends StatefulWidget {
  const CustomMenuItem({super.key, required this.text, required this.onTap, this.delay = 0});
  final String text;
  final Function()? onTap;
  final int delay;
  @override
  State<CustomMenuItem> createState() => _CustomMenuItemState();
}

class _CustomMenuItemState extends State<CustomMenuItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      from: 30,
      duration: const Duration(milliseconds: 200),
      delay: Duration(milliseconds: widget.delay),
      child: MouseRegion(
        onEnter: (event) => setState(() => isHover = true),
        onExit: (event) => setState(() => isHover = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 150,
            height: 50,
            color: isHover ? Colors.pinkAccent : Colors.transparent,
            child: Center(
              child: Text(
                widget.text,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
