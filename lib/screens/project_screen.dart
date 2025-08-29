import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_pro/data/data.dart';
import 'dart:math';

import 'package:todo_pro/models/item_model.dart';
import 'package:todo_pro/widgets/project/item_card.dart';

class ProjectScreen extends StatefulWidget {
  final String projectTitle;

  const ProjectScreen({super.key, required this.projectTitle});
  // const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  final List<ItemModel> items = getItemsData();

  final Random _random = Random();
  final List<String> allSVGs = getSVGs();

  String _getRandomSVG() {
    return allSVGs[_random.nextInt(allSVGs.length)];
  }

  @override
  Widget build(BuildContext context) {
    final uncompleted = items.where((item) => item.isDone == false).toList();
    final completed = items.where((item) => item.isDone == true).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(24),
                  ),
                  color: Colors.blue.shade50,
                ),
                child: Opacity(
                  opacity: 0.2,
                  child: SvgPicture.asset(_getRandomSVG(), fit: BoxFit.cover),
                ),
              ),

              //
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Text(
                        widget.projectTitle,
                        // "widget.projectTitle",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.blue.shade900,
                        ),
                      ),
                      const SizedBox(width: 40),
                    ],
                  ),
                ),
              ),

              //
              Positioned(
                bottom: 15,
                left: 0,
                right: 0,
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "New Item",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),

          //
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                children: [
                  if (uncompleted.isNotEmpty) ...[
                    Text(
                      "Uncompleted",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...uncompleted.map(
                      (item) => ItemCard(
                        item: item,
                        onChanged: (val) {
                          setState(() {
                            item.isDone = val ?? false;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],

                  if (completed.isNotEmpty) ...[
                    Text(
                      "Completed",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...completed.map(
                      (item) => ItemCard(
                        item: item,
                        onChanged: (val) {
                          setState(() {
                            item.isDone = val ?? false;
                          });
                        },
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
