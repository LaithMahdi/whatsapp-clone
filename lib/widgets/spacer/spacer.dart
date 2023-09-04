import 'package:flutter/material.dart';
import '../../core/constant/app_size.dart';

class HorizintalSpacer extends StatelessWidget {
  const HorizintalSpacer(this.value, {super.key});
  final double? value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.defaultSize! * value!,
    );
  }
}

class VerticalSpacer extends StatelessWidget {
  const VerticalSpacer(this.value, {super.key});
  final double? value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.defaultSize! * value!,
    );
  }
}
