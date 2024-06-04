import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:bloc_showcase/src/constants/app_constants.dart';
import 'package:bloc_showcase/src/constants/string_constants.dart';
import 'package:bloc_showcase/src/model/home/res_home_model.dart';
import 'package:flutter/cupertino.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    ///Fetch Event
    on<HomeFetchEvent>((event, emit) async {
      // appState.storage.delete(key: AppConstants.userDetail);
      String? stringOfItems = await appState.storage.read(key: AppConstants.userDetail);
      debugPrint(stringOfItems);
      if ((stringOfItems ?? '').isNotEmpty) {
        List<ResHomeModel>? readData = [];
        readData.addAll(List<ResHomeModel>.from(jsonDecode(stringOfItems ?? '').map((x) => ResHomeModel.fromJson(x))));
        emit(HomeSuccess(homeList: readData));
      } else if (stringOfItems == null) {
        emit(HomeSuccess(homeList: []));
      } else {
        emit(HomeFailure());
      }
    });

    ///Delete Event
    on<HomeDeleteEvent>((event, emit) async {
      String? stringOfItems = await appState.storage.read(key: AppConstants.userDetail);
      debugPrint(stringOfItems);
      if ((stringOfItems ?? '').isNotEmpty) {
        List<ResHomeModel> readData = [];
        readData.addAll(List<ResHomeModel>.from(jsonDecode(stringOfItems ?? '').map((x) => ResHomeModel.fromJson(x))));
        readData.removeWhere((element) => element.email == event.email);
        appState.storage.write(key: AppConstants.userDetail, value: jsonEncode(readData));
        emit(HomeSuccess(homeList: readData));
      } else {
        emit(HomeFailure());
      }
    });
  }
}
