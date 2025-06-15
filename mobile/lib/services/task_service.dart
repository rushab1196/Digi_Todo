import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/task.dart';

class TaskService {
  final String baseUrl;

  TaskService(this.baseUrl);

  Future<List<Task>> fetchTasks() async {
    final response = await http.get(Uri.parse('$baseUrl/tasks'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body) as List<dynamic>;
      return data.map((e) => Task.fromJson(e as Map<String, dynamic>)).toList();
    }
    throw Exception('Failed to fetch tasks');
  }
}
