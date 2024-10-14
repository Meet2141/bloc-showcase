import 'package:bloc_showcase/src/model/task/task_model.dart';
import 'package:bloc_showcase/src/views/task/bloc/task_bloc.dart';
import 'package:bloc_showcase/src/views/task/widgets/task_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskView extends StatefulWidget {
  final TaskBloc taskBloc;

  const TaskView({
    super.key,
    required this.taskBloc,
  });

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _showTaskForm(context, null, null);
            },
          ),
        ],
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        bloc: widget.taskBloc,
        builder: (context, state) {
          if (state is TaskListUpdatedState) {
            if (state.taskList.isEmpty) {
              return Center(child: Text('No Tasks Added'));
            } else {
              return ListView.builder(
                itemCount: state.taskList.length,
                itemBuilder: (context, index) {
                  final task = state.taskList[index];
                  return Card(
                    child: ListTile(
                      title: Text(task.name),
                      subtitle: Text(task.description),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              _showTaskForm(context, index, task);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _showDeleteConfirmation(context, index);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<void> _showTaskForm(BuildContext context, int? index, TaskModel? taskModel) async {
    await showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return TaskForm(
          index: index,
          taskModel: taskModel,
        );
      },
    ).then((value) async {
      if (value != null && context.mounted) {
        if (index == null) {
          context.read<TaskBloc>().add(AddTaskEvent(value));
        } else {
          context.read<TaskBloc>().add(UpdateTaskEvent(index, value));
        }
      }
    });
  }

  void _showDeleteConfirmation(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Task'),
          content: Text('Are you sure you want to delete this task?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                context.read<TaskBloc>().add(DeleteTaskEvent(index));
                Navigator.pop(context);
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
