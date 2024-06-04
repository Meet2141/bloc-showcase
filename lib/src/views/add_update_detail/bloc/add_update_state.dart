part of 'add_update_bloc.dart';

sealed class AddUpdateState {
  const AddUpdateState();
}

final class AddUpdateInitial extends AddUpdateState {}

final class AddUpdateClickSuccess extends AddUpdateState {}

final class AddUpdateClickFailure extends AddUpdateState {}
