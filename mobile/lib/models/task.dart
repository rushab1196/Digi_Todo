class Task {
  final int id;
  final String title;
  final String? description;
  final DateTime? dueDate;
  final bool completed;

  Task({
    required this.id,
    required this.title,
    this.description,
    this.dueDate,
    this.completed = false,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['id'] as int,
        title: json['title'] as String,
        description: json['description'] as String?,
        dueDate:
            json['due_date'] != null ? DateTime.parse(json['due_date']) : null,
        completed: json['completed'] as bool? ?? false,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'due_date': dueDate?.toIso8601String(),
        'completed': completed,
      };
}
