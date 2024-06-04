import 'package:bloc_showcase/src/constants/color_constants.dart';
import 'package:bloc_showcase/src/constants/image_constants.dart';
import 'package:bloc_showcase/src/extension/gesture_extensions.dart';
import 'package:bloc_showcase/src/extension/image_extensions.dart';
import 'package:bloc_showcase/src/extension/scaffold_extensions.dart';
import 'package:bloc_showcase/src/widgets/text_widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// AppBarWidgets class is contain AppBar used in app
class AppBarWidgets extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final Widget? actions;
  final bool? isBack;

  const AppBarWidgets({
    super.key,
    required this.title,
    this.onTap,
    this.actions,
    this.isBack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.transparent,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Padding(
        padding: const EdgeInsets.only(top: 4, bottom: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isBack ?? false)
              (ImageConstants.icLeftArrow).getSVGImageHW(color: ColorConstants.white).onPressedWithoutHaptic(() {
                if (onTap != null) {
                  onTap!();
                } else {
                  context.pop(true);
                }
              }),
            Expanded(
              child: TextWidgets(
                text: title,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                textColor: ColorConstants.white,
              ).bodyPadding(horizontal: 8).onPressedWithoutHaptic(() {
                if (onTap != null) {
                  onTap!();
                } else {
                  context.pop(true);
                }
              }),
            ),
            actions != null
                ? actions ?? const SizedBox.shrink()
                : const SizedBox(
                    height: 32,
                    width: 10,
                  ),
          ],
        ),
      ),
    );
  }
}
