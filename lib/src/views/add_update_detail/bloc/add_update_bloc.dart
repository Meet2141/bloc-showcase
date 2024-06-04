import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_showcase/src/constants/app_constants.dart';
import 'package:bloc_showcase/src/constants/string_constants.dart';
import 'package:bloc_showcase/src/model/home/res_home_model.dart';
import 'package:flutter/material.dart';

part 'add_update_event.dart';

part 'add_update_state.dart';

class AddUpdateBloc extends Bloc<AddUpdateEvent, AddUpdateState> {
  AddUpdateBloc() : super(AddUpdateInitial()) {
    ///Add Event
    on<AddUpdateClickEvent>((event, emit) async {
      String? data = await appState.storage.read(key: AppConstants.userDetail);
      List<ResHomeModel> tempList = [];
      debugPrint('------$data');
      if ((data ?? '').isNotEmpty) {
        tempList.addAll(List<ResHomeModel>.from(jsonDecode(data ?? '').map((x) => ResHomeModel.fromJson(x))));
        if (tempList.any((element) => (element.email ?? '').toLowerCase() == (event.email ?? '').toLowerCase())) {
          debugPrint('Error');
          emit(AddUpdateClickFailure());
        } else {
          debugPrint('Read Write');
          tempList.add(ResHomeModel(name: event.name, email: event.email, phone: event.phone));
          appState.storage.write(key: AppConstants.userDetail, value: jsonEncode(tempList));
          emit(AddUpdateClickSuccess());
        }
      } else {
        debugPrint('Write');
        tempList.add(ResHomeModel(name: event.name, email: event.email, phone: event.phone));
        appState.storage.write(key: AppConstants.userDetail, value: jsonEncode(tempList));
        emit(AddUpdateClickSuccess());
      }
    });
  }
}
