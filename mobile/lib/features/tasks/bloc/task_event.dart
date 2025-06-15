part of 'task_bloc.dart';


import '../models/tag.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object?> get props => [];
}

class LoadTasks extends TaskEvent {}


class AddTask extends TaskEvent {
  final int userId;
  final String title;
  final String? description;
  final DateTime? dueAt;
  final List<Tag> tags;

  const AddTask({
    required this.userId,
    required this.title,
    this.description,
    this.dueAt,
    this.tags = const [],
  });

  @override
  List<Object?> get props => [userId, title, description, dueAt, tags];
}

class ToggleTaskCompletion extends TaskEvent {
  final Task task;
  final bool isCompleted;

  const ToggleTaskCompletion(this.task, this.isCompleted);

  @override
  List<Object?> get props => [task, isCompleted];
}

class AddTask extends TaskEvent {
  final int userId;


    required this.userId,
  List<Object?> get props => [userId, title, description, dueAt];

  final String title;
  final String? description;
  final DateTime? dueAt;

  const AddTask({

    required this.userId,

    required this.title,
    this.description,
    this.dueAt,
  });

  @override

  List<Object?> get props => [userId, title, description, dueAt];
}


