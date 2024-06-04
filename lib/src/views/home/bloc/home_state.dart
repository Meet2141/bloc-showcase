part of 'home_bloc.dart';

sealed class HomeState {
  const HomeState();
}

final class HomeInitial extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<ResHomeModel?>? homeList;

  HomeSuccess({this.homeList});
}

final class HomeFailure extends HomeState {}
