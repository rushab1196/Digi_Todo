import 'package:flutter/material.dart';

void main() {
  runApp(const DigiTaskApp());
}

class DigiTaskApp extends StatelessWidget {
  const DigiTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digi Task',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const TaskListScreen(),
    );
  }
}

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
      ),
      body: const Center(
        child: Text('No tasks yet'),
      ),
    );
  }
}
