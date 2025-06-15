part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object?> get props => [];
}

class LoadTasks extends TaskEvent {}


class AddTask extends TaskEvent {
  final int userId;
=======
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
=======
  List<Object?> get props => [title, description, dueAt];
}


