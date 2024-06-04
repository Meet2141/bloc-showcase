import 'package:bloc_showcase/src/constants/color_constants.dart';
import 'package:bloc_showcase/src/constants/image_constants.dart';
import 'package:bloc_showcase/src/constants/route_constants.dart';
import 'package:bloc_showcase/src/extension/gesture_extensions.dart';
import 'package:bloc_showcase/src/extension/image_extensions.dart';
import 'package:bloc_showcase/src/extension/scaffold_extensions.dart';
import 'package:bloc_showcase/src/model/home/res_home_model.dart';
import 'package:bloc_showcase/src/views/home/bloc/home_bloc.dart';
import 'package:bloc_showcase/src/widgets/text_widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

///HomeCardWidget - Display Home Card Widget
class HomeCardWidget extends StatelessWidget {
  final ResHomeModel homeModel;

  const HomeCardWidget({
    super.key,
    required this.homeModel,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: ColorConstants.grey.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidgets(
                  text: homeModel.name ?? '',
                  fontWeight: FontWeight.w600,
                ),
                TextWidgets(
                  text: homeModel.email ?? '',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                if (homeModel.phone != null)
                  TextWidgets(
                    text: (homeModel.phone ?? -1).toString(),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Row(
            children: [
              ImageConstants.icEdit
                  .getSVGImageHW(
                color: ColorConstants.black,
                height: 20,
                width: 20,
              )
                  .onPressedWithHaptic(() {
                ///Navigate to Update Screen
                GoRouter.of(context).pushNamed(RouteConstants.addUpdateDetail, extra: homeModel);
              }),
              const SizedBox(width: 5),
              ImageConstants.icDelete
                  .getSVGImageHW(
                color: ColorConstants.red,
              )
                  .onPressedWithHaptic(() {
                context.read<HomeBloc>().add(HomeDeleteEvent(email: homeModel.email ?? ''));
              })
            ],
          )
        ],
      ).bodyPadding(),
    ).bodyPadding(vertical: 0);
  }
}
