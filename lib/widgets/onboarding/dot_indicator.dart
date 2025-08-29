import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final int length;
  final int active;

  const DotIndicator({super.key, required this.length, required this.active});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: active == index ? 20 : 8,
          decoration: BoxDecoration(
            color: active == index
                ? Colors.blue.shade700
                : Colors.blue.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
