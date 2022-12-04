import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vertical_landing_page/ui/shared/custom_menu_item.dart';

class CustomAppMenu extends StatefulWidget {
  const CustomAppMenu({super.key});

  @override
  State<CustomAppMenu> createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu> with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click, // Modificar forma del mouse
      child: GestureDetector(
        onTap: () {
          isOpen ? animationController.reverse() : animationController.forward();
          setState(() {
            isOpen = !isOpen;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: 150,
          height: isOpen ? 320 : 50,
          color: Colors.black,
          child: Column(
            children: [
              _MenuTitle(isOpen: isOpen, animationController: animationController),
              if (isOpen) ...[
                CustomMenuItem(text: 'Home', onTap: () {}, delay: 0),
                CustomMenuItem(text: 'About', onTap: () {}, delay: 30),
                CustomMenuItem(text: 'Pricing', onTap: () {}, delay: 60),
                CustomMenuItem(text: 'Contact', onTap: () {}, delay: 90),
                CustomMenuItem(text: 'Location', onTap: () {}, delay: 120),
                const SizedBox(height: 10),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    Key? key,
    required this.isOpen,
    required this.animationController,
  }) : super(key: key);

  final bool isOpen;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 50,
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: isOpen ? 30 : 0,
            curve: Curves.easeInOut,
          ),
          Text('Menu', style: GoogleFonts.roboto(fontSize: 18, color: Colors.white)),
          const Spacer(),
          AnimatedIcon(icon: AnimatedIcons.menu_close, progress: animationController, color: Colors.white)
        ],
      ),
    );
  }
}
