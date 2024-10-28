//FAB for scroll-to-top functionality
// lib/ui/widgets/scroll_to_top_button.dart
import 'package:flutter/material.dart';

class ScrollToTopButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ScrollToTopButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(Icons.arrow_upward),
    );
  }
}