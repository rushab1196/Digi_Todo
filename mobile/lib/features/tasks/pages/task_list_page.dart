import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/task_bloc.dart';
import '../data/task_repository.dart';
import '../models/task.dart';
import 'add_task_page.dart';

class TaskListPage extends StatelessWidget {
  final String baseUrl;

  const TaskListPage({super.key, required this.baseUrl});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TaskBloc(repository: TaskRepository(baseUrl: baseUrl))
        ..add(LoadTasks()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Tasks')),
        body: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            if (state is TaskLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TaskLoaded) {
              return ListView.builder(
                itemCount: state.tasks.length,
                itemBuilder: (context, index) {
                  final task = state.tasks[index];
                  return ListTile(
                    title: Text(task.title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (task.description != null) Text(task.description!),
                        if (task.dueAt != null)
                          Text(
                            'Due: \${task.dueAt!.toLocal().toString().split(" ")[0]}',
                            style: const TextStyle(fontSize: 12),
                          ),
                        if (task.tags.isNotEmpty)
                          Wrap(
                            spacing: 4,
                            children: task.tags
                                .map(
                                  (tag) => Chip(
                                    label: Text(tag.name, style: const TextStyle(fontSize: 12)),
                                    backgroundColor: tag.color,
                                  ),
                                )
                                .toList(),
                          ),
                      ],
                    ),
                    trailing: task.isCompleted
                        ? const Icon(Icons.check_circle, color: Colors.green)
                        : null,
                    onTap: () {
                      context.read<TaskBloc>().add(
                            ToggleTaskCompletion(task, !task.isCompleted),
                          );
                    },
                  );
                },
              );
            } else if (state is TaskError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox.shrink();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => AddTaskPage(baseUrl: baseUrl),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
