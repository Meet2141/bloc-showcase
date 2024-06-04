import 'package:bloc_showcase/src/constants/string_constants.dart';
import 'package:bloc_showcase/src/widgets/text_widgets/text_widgets.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: TextWidgets(
          text: StringConstants.error,
        ),
      ),
    );
  }
}
