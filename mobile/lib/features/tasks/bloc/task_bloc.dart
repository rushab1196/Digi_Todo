import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/task_repository.dart';
import '../models/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository repository;

  TaskBloc({required this.repository}) : super(TaskLoading()) {
    on<LoadTasks>((event, emit) async {
      emit(TaskLoading());
      try {
        final tasks = await repository.fetchTasks();
        emit(TaskLoaded(tasks));
      } catch (e) {
        emit(TaskError(e.toString()));
      }
    });



    on<ToggleTaskCompletion>((event, emit) async {
      try {
        final updatedTask = await repository.updateTask(
          event.task.id,
          isCompleted: event.isCompleted,
        );

        if (state is TaskLoaded) {
          final tasks = (state as TaskLoaded)
              .tasks
              .map((t) => t.id == updatedTask.id ? updatedTask : t)
              .toList();
          emit(TaskLoaded(tasks));
        } else {
          add(LoadTasks());
        }
      } catch (e) {
        emit(TaskError(e.toString()));
      }
    });
    on<AddTask>((event, emit) async {
      try {
        final newTask = await repository.createTask(
          event.userId,
=======
          event.userId,

    on<AddTask>((event, emit) async {
      try {
        final newTask = await repository.createTask(

          event.title,
          description: event.description,
          dueAt: event.dueAt,
        );

        if (state is TaskLoaded) {
          final updated = List<Task>.from((state as TaskLoaded).tasks)..add(newTask);
          emit(TaskLoaded(updated));
        } else {
          add(LoadTasks());
        }
      } catch (e) {
        emit(TaskError(e.toString()));
      }
    });

  }
}
