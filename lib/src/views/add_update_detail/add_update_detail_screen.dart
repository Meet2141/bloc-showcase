import 'package:bloc_showcase/src/model/home/res_home_model.dart';
import 'package:bloc_showcase/src/views/add_update_detail/bloc/add_update_bloc.dart';
import 'package:bloc_showcase/src/views/add_update_detail/widget/add_update_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddUpdateDetailScreen extends StatelessWidget {
  final ResHomeModel model;

  const AddUpdateDetailScreen({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddUpdateBloc(),
      child:  AddUpdateDetailView(model: model),
    );
  }
}
