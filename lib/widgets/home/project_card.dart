import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String svgPath;
  const ProjectCard({super.key, required this.title, required this.svgPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.blue.shade50,
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.2,
              child: SvgPicture.asset(svgPath, fit: BoxFit.cover),
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.blue.shade900,
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/project', arguments: title);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "View Details",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
