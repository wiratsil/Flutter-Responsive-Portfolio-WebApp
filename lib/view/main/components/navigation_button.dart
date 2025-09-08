import 'package:flutter/material.dart';

class NavigationTextButton extends StatefulWidget {
  final VoidCallback onTap;
  final String text;

  const NavigationTextButton(
      {super.key, required this.onTap, required this.text});

  @override
  State<NavigationTextButton> createState() => _NavigationTextButtonState();
}

class _NavigationTextButtonState extends State<NavigationTextButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => _isHovered = true),
      onExit: (event) => setState(() => _isHovered = false),
      child: TextButton(
        onPressed: widget.onTap,
        child: Text(
          widget.text,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                decoration: _isHovered ? TextDecoration.underline : TextDecoration.none,
              ),
        ),
      ),
    );
  }
}