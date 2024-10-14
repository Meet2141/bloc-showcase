import 'package:bloc_showcase/src/views/task/bloc/task_bloc.dart';
import 'package:bloc_showcase/src/views/task/widgets/task_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskBloc taskBloc = TaskBloc();
    return BlocProvider(
      create: (context) => taskBloc,
      child: TaskView(taskBloc: taskBloc),
    );
  }
}
