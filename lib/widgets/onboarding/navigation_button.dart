import 'package:flutter/material.dart';

class NavigationButtons extends StatefulWidget {
  final int length;
  final int active;
  final PageController controller;

  const NavigationButtons({
    super.key,
    required this.length,
    required this.active,
    required this.controller,
  });

  @override
  State<NavigationButtons> createState() => _NavigationButtonsState();
}

class _NavigationButtonsState extends State<NavigationButtons> {

  void _nextPage(int active, int length) {
    if (active < length - 1) {
      widget.controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _goToAuth();
    }
  }

  void _prevPage(int active) {
    if (active > 0) {
      widget.controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToAuth() {
    Navigator.pushReplacementNamed(context, '/auth');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Previous button (hidden on first page)
          TextButton(
            onPressed: () => _prevPage(widget.active),
            child: Text(
              "Previous",
              style: TextStyle(
                color: widget.active > 0
                    ? Colors.blue.shade700
                    : Colors.grey.shade400,
              ),
            ),
          ),

          // Next / Start button
          ElevatedButton(
            onPressed: () => _nextPage(widget.active, widget.length),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade700,
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              widget.active == widget.length - 1 ? "Start" : "Next",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
