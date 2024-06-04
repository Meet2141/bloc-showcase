part of 'add_update_bloc.dart';

sealed class AddUpdateEvent {
  const AddUpdateEvent();
}

class AddUpdateClickEvent extends AddUpdateEvent {
  final String? name;
  final String? email;
  final int? phone;

  AddUpdateClickEvent({this.email, this.phone, this.name});
}
