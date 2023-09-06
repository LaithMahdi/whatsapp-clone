import 'package:flutter/material.dart';
import '../../../../core/constant/app_color.dart';

class HeaderButton extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final VoidCallback onPressed;
  final bool? isVideo;
  const HeaderButton(
      {super.key,
      required this.icon,
      this.color,
      this.isVideo,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        padding: EdgeInsets.all(isVideo == null || isVideo == false ? 0 : 20),
        shape: const CircleBorder(),
        backgroundColor: color ?? AppColor.black.withOpacity(0.5),
      ),
      icon: Icon(
        icon,
        color: AppColor.white,
        size: isVideo == null || isVideo == false ? 27 : 33,
      ),
    );
  }
}
