import 'package:bloc_showcase/src/constants/color_constants.dart';
import 'package:bloc_showcase/src/widgets/appbar_widgets/appbar_bg_widgets.dart';
import 'package:bloc_showcase/src/widgets/appbar_widgets/appbar_widgets.dart';
import 'package:flutter/material.dart';

///ScaffoldExtension class return scaffold widget with fixed layout properties.
extension ScaffoldExtension on Widget {
  PopScope baseScaffold({
    required String title,
    required VoidCallback onTap,
    bool? isBack,
    Widget? actions,
  }) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: ColorConstants.white,
          primary: true,
          body: Column(
            children: [
              Stack(
                children: [
                  const AppbarBgWidgets(height: 40),
                  AppBarWidgets(
                    title: title,
                    isBack: isBack ?? false,
                    onTap: onTap,
                    actions: actions,
                  ),
                ],
              ),
              Expanded(child: this)
            ],
          ),
        ));
  }

  Widget bodyPadding({double? horizontal, double? vertical}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal ?? 8, vertical: vertical ?? 8),
      child: this,
    );
  }
}
