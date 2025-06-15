part of 'task_bloc.dart';

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

  const AddTask({
    required this.userId,
    required this.title,
    this.description,
    this.dueAt,
  });

  @override
  List<Object?> get props => [userId, title, description, dueAt];
}
