import 'package:flutter/material.dart';
import '../../../../core/constant/app_color.dart';

class CustomContactItem extends StatelessWidget {
  final String name;
  final String? secondeName;
  final bool? isSecond;
  final VoidCallback? onTap;
  final IconData? icon;
  final bool isSelect;
  const CustomContactItem(
      {super.key,
      required this.name,
      this.secondeName,
      this.isSecond,
      this.onTap,
      this.icon,
      required this.isSelect});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Stack(
        children: [
          CircleAvatar(
            backgroundColor: isSecond == false || isSecond == null
                ? AppColor.blueGrey200
                : AppColor.third,
            radius: 23,
            child: Icon(
                isSecond == false || isSecond == null ? Icons.person : icon,
                size: 30,
                color: AppColor.white),
          ),
          isSecond == false || isSecond == null && isSelect == true
              ? const Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                      radius: 12,
                      backgroundColor: AppColor.second,
                      child:
                          Icon(Icons.check, color: AppColor.white, size: 16)),
                )
              : const SizedBox(),
        ],
      ),
      title: Text(
        name,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      subtitle: isSecond == false || isSecond == null
          ? Text(
              secondeName!,
              style:
                  const TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
            )
          : null,
    );
  }
}
