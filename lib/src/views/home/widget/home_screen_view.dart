import 'package:bloc_showcase/src/constants/color_constants.dart';
import 'package:bloc_showcase/src/constants/image_constants.dart';
import 'package:bloc_showcase/src/constants/route_constants.dart';
import 'package:bloc_showcase/src/constants/string_constants.dart';
import 'package:bloc_showcase/src/extension/gesture_extensions.dart';
import 'package:bloc_showcase/src/extension/image_extensions.dart';
import 'package:bloc_showcase/src/extension/scaffold_extensions.dart';
import 'package:bloc_showcase/src/model/home/res_home_model.dart';
import 'package:bloc_showcase/src/views/home/bloc/home_bloc.dart';
import 'package:bloc_showcase/src/views/home/widget/home_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  @override
  void initState() {
    context.read<HomeBloc>().add(HomeFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeFailure) {
          return const SnackBar(content: Text('Something went wrong'));
        }
        if (state is HomeSuccess) {
          return Column(
            children: [
              ///ListView
              Expanded(
                child: SingleChildScrollView(
                  child: (state.homeList ?? []).isEmpty
                      ? const Center(
                          child: Text('No data'),
                        )
                      : ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: (state.homeList ?? []).length,
                          separatorBuilder: (c, i) {
                            return const SizedBox(height: 8);
                          },
                          itemBuilder: (c, i) {
                            ResHomeModel homeModel = (state.homeList ?? [])[i] ?? ResHomeModel();
                            return HomeCardWidget(homeModel: homeModel);
                          },
                        ),
                ),
              ),

              ///Bottom Padding
              SizedBox(height: MediaQuery.paddingOf(context).bottom),
            ],
          );
        }
        return const CircularProgressIndicator();
      },
    ).baseScaffold(
      title: StringConstants.userDetails,
      onTap: () {},
      actions: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: ImageConstants.icAdd.getSVGImageHW(
            color: ColorConstants.white,
            height: 20,
          ),
        ),
      ).onPressedWithHaptic(() {
        ///Navigate to Add Screen
        GoRouter.of(context).pushNamed(RouteConstants.addUpdateDetail, extra: ResHomeModel()).then((value) {
          if (value == true) {
            context.read<HomeBloc>().add(HomeFetchEvent());
          } else {
            context.read<HomeBloc>().add(HomeFetchEvent());
          }
        });
        // context.go(RouteConstants.addUpdateDetail);
      }),
    );
  }
}
