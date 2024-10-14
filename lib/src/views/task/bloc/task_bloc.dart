import 'package:bloc_showcase/src/model/task/task_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'task_event.dart';

part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  List<TaskModel> tasks = [];

  TaskBloc() : super(TaskInitialState()) {
    on<AddTaskEvent>((event, emit) {
      tasks.add(event.taskModel);
      emit(TaskListUpdatedState(List.from(tasks)));
    });

    on<UpdateTaskEvent>((event, emit) {
      tasks[event.index] = event.taskModel;
      emit(TaskListUpdatedState(List.from(tasks)));
    });

    on<DeleteTaskEvent>((event, emit) {
      tasks.removeAt(event.index);
      emit(TaskListUpdatedState(List.from(tasks)));
    });
  }
}
