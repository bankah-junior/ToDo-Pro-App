import 'dart:math';
import 'package:flutter/material.dart';
import 'package:todo_pro/data/data.dart';
import 'package:todo_pro/models/project_model.dart';
import 'package:todo_pro/widgets/home/project_card.dart';
import 'package:todo_pro/widgets/home/user_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ProjectModel> projects = [
    ProjectModel(title: "Work Prokect"),
    ProjectModel(title: "Personal Tasks"),
    ProjectModel(title: "Shopping List"),
    ProjectModel(title: "Fitness Goals"),
  ];

  final Random _random = Random();
  final List<String> allSVGs = getSVGs();

  String _getRandomSVG() {
    return allSVGs[_random.nextInt(allSVGs.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              UserInfo(),
              const SizedBox(height: 24),

              //
              Text(
                "My Projects",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade700,
                ),
              ),
              const SizedBox(height: 16),

              // Project Cards
              Expanded(
                child: ListView.builder(
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    final project = projects[index];
                    final svgPath = _getRandomSVG();

                    return ProjectCard(title: project.title, svgPath: svgPath);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
