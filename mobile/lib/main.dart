import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


import 'features/tasks/pages/task_list_page.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');


import 'features/tasks/pages/task_list_page.dart';


Future<void> main() async {
  await dotenv.load(fileName: '.env');

void main() {


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digi Task',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),

      home: TaskListPage(baseUrl: dotenv.env['API_BASE_URL'] ?? ''),


      home: TaskListPage(baseUrl: dotenv.env['API_BASE_URL'] ?? ''),

      home: const TaskListPage(baseUrl: 'http://10.0.2.2/api'),


    );
  }
}
