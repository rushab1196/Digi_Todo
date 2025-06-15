import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/task.dart';

class TaskRepository {
  final String baseUrl;
  final http.Client _client;

  TaskRepository({required this.baseUrl, http.Client? client})
      : _client = client ?? http.Client();

  Future<List<Task>> fetchTasks() async {
    final response = await _client.get(Uri.parse('$baseUrl/tasks'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body) as List<dynamic>;
      return jsonData
          .map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    throw Exception('Failed to load tasks');
  }

    int userId,
        'user_id': userId,
  Future<Task> createTask(
    String title, {
    String? description,
    DateTime? dueAt,
  }) async {
    final response = await _client.post(
      Uri.parse('$baseUrl/tasks'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'user_id': 1,
        'title': title,
        'description': description,
        if (dueAt != null) 'due_at': dueAt.toIso8601String(),
      }),
    );

    if (response.statusCode == 201) {
      return Task.fromJson(
        json.decode(response.body) as Map<String, dynamic>,
      );
    }
    throw Exception('Failed to create task');
  }

}
