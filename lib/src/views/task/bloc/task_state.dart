part of 'task_bloc.dart';

abstract class TaskState {}

final class TaskInitialState extends TaskState {}

class TaskListUpdatedState extends TaskState {
  final List<TaskModel> taskList;

  TaskListUpdatedState(this.taskList);
}

