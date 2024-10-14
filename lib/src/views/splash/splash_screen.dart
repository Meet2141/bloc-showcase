import 'package:bloc_showcase/src/constants/route_constants.dart';
import 'package:bloc_showcase/src/constants/string_constants.dart';
import 'package:bloc_showcase/src/widgets/text_widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      if (mounted) {
        GoRouter.of(context).pushReplacementNamed(RouteConstants.task);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: TextWidgets(
          text: StringConstants.appName,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
