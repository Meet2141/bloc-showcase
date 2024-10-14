import 'package:bloc_showcase/src/model/task/task_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TaskForm extends StatefulWidget {
  final int? index;
  final TaskModel? taskModel;

  const TaskForm({
    super.key,
    this.index,
    this.taskModel,
  });

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _status = 'Pending';

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      final task = widget.taskModel;
      _nameController.text = task?.name ?? '';
      _descriptionController.text = task?.description ?? '';
      _status = task?.status ?? _status;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name';
                }
                return null;
              },
            ),
            DropdownButtonFormField<String>(
              value: _status,
              decoration: InputDecoration(labelText: 'Status'),
              items: ['Pending', 'Progress', 'Completed'].map((status) {
                return DropdownMenuItem(
                  value: status,
                  child: Text(status),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _status = value!;
                });
              },
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
              maxLines: 2,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a description';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final task = TaskModel(
                    name: _nameController.text,
                    status: _status,
                    description: _descriptionController.text,
                  );
                  context.pop(task);
                }
              },
              child: Text(widget.index == null ? 'Add Task' : 'Update Task'),
            ),
          ],
        ),
      ),
    );
  }
}
