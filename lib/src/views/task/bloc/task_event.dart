part of 'task_bloc.dart';

abstract class TaskEvent {}

class AddTaskEvent extends TaskEvent {
  final TaskModel taskModel;

  AddTaskEvent(this.taskModel);
}

class UpdateTaskEvent extends TaskEvent {
  final int index;
  final TaskModel taskModel;

  UpdateTaskEvent(this.index, this.taskModel);
}

class DeleteTaskEvent extends TaskEvent {
  final int index;

  DeleteTaskEvent(this.index);
}
