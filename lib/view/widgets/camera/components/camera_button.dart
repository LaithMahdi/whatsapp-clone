import 'package:flutter/material.dart';
import '../../../../core/constant/app_color.dart';

class CameraButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const CameraButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: 25,
        backgroundColor: AppColor.black.withOpacity(0.5),
        child: Icon(icon, color: AppColor.white),
      ),
    );
  }
}
