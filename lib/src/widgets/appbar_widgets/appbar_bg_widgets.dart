import 'package:bloc_showcase/src/constants/color_constants.dart';
import 'package:flutter/material.dart';

class AppbarBgWidgets extends StatelessWidget {
  final double height;

  const AppbarBgWidgets({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Stack(
        children: [
          Container(
            color: ColorConstants.black,
            height: MediaQuery.of(context).padding.top + height,
            width: double.infinity,
          ),
          Positioned(
            left: 40,
            top: 50,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [BoxShadow(color: ColorConstants.primary, blurRadius: 100, spreadRadius: 40)]),
              height: MediaQuery.of(context).padding.top + height,
              width: 10,
            ),
          ),
          Positioned(
            right: 50,
            top: 50,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [BoxShadow(color: ColorConstants.grey, blurRadius: 70, spreadRadius: 30)]),
              height: MediaQuery.of(context).padding.top + height,
              width: 10,
            ),
          )
        ],
      ),
    );
  }
}
