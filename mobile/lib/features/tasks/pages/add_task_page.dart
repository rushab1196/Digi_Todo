import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/task_bloc.dart';
import '../data/tag_repository.dart';
import '../models/tag.dart';

class AddTaskPage extends StatefulWidget {
  final String baseUrl;
  const AddTaskPage({super.key, required this.baseUrl});


class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});


  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime? _dueAt;
  late final TagRepository _tagRepository;
  List<Tag> _availableTags = [];
  final Set<int> _selectedTagIds = {};

  @override
  void initState() {
    super.initState();
    _tagRepository = TagRepository(baseUrl: widget.baseUrl);
    _loadTags();
  }

  Future<void> _loadTags() async {
    try {
      final tags = await _tagRepository.fetchTags();
      setState(() => _availableTags = tags);
    } catch (_) {}
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Task')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _dueAt != null
                          ? 'Due: \${_dueAt!.toLocal().toString().split(" ")[0]}'
                          : 'No due date',
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      final now = DateTime.now();
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: now,
                        firstDate: now,
                        lastDate: DateTime(now.year + 5),
                      );
                      if (picked != null) {
                        setState(() => _dueAt = picked);
                      }
                    },
                    child: const Text('Select Due Date'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (_availableTags.isNotEmpty)
                Wrap(
                  spacing: 8,
                  children: _availableTags
                      .map(
                        (tag) => FilterChip(
                          label: Text(tag.name),

                          backgroundColor: tag.color,
                          selectedColor: tag.color,

                          selected: _selectedTagIds.contains(tag.id),
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                _selectedTagIds.add(tag.id);
                              } else {
                                _selectedTagIds.remove(tag.id);
                              }
                            });
                          },
                        ),
                      )
                      .toList(),
                ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<TaskBloc>().add(AddTask(
                          userId: 1,
                          title: _titleController.text,
                          description: _descriptionController.text.isEmpty
                              ? null
                              : _descriptionController.text,
                          dueAt: _dueAt,
                          tags: _availableTags
                              .where((t) => _selectedTagIds.contains(t.id))
                              .toList(),

                        ));
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


