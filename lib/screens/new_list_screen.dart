import 'package:flutter/material.dart';

class NewListScreen extends StatefulWidget {
  const NewListScreen({ super.key });

  @override
  State<NewListScreen> createState() => _NewListScreenState();
}

class _NewListScreenState extends State<NewListScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('New List Screen'));
  }
}