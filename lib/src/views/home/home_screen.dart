import 'package:bloc_showcase/src/views/home/bloc/home_bloc.dart';
import 'package:bloc_showcase/src/views/home/widget/home_screen_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///HomeScreen - Display Home Screen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: const HomeScreenView(),
    );
  }
}
