import 'package:flutter/material.dart';

extension SizedBoxInt on int {
  Widget get sw => SizedBox(
    width: double.parse(toString()),
  );

  Widget get sh => SizedBox(
    height: double.parse(toString()),
  );
}

extension SizedBoxDouble on double {
  Widget get sw => SizedBox(
    width: this,
  );

  Widget get sh => SizedBox(
    height: this,
  );
}