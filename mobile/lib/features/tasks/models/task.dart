
import 'tag.dart';

class Task {
  final int id;
  final String title;
  final String? description;
  final DateTime? dueAt;
  final bool isCompleted;
  final List<Tag> tags;


  Task({
    required this.id,
    required this.title,
    this.description,
    this.dueAt,
    this.isCompleted = false,
    this.tags = const [],

  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String?,
      dueAt:
          json['due_at'] != null ? DateTime.parse(json['due_at'] as String) : null,
      isCompleted: json['is_completed'] as bool? ?? false,
      tags: (json['tags'] as List<dynamic>? ?? [])
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
