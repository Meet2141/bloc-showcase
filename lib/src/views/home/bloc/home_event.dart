part of 'home_bloc.dart';

sealed class HomeEvent {
  const HomeEvent();
}

class HomeFetchEvent extends HomeEvent {}

class HomeDeleteEvent extends HomeEvent {
  final String email;

  HomeDeleteEvent({required this.email});
}
