import 'package:flutter/material.dart';
import '../../../../core/constant/app_color.dart';

class HeaderButton extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final VoidCallback onPressed;
  const HeaderButton(
      {super.key, required this.icon, this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: color ?? AppColor.black.withOpacity(0.5),
      ),
      icon: Icon(
        icon,
        color: AppColor.white,
        size: 27,
      ),
    );
  }
}
