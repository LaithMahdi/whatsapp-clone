import 'package:flutter/material.dart';
import '../../../../core/constant/app_color.dart';

class CaptionInput extends StatelessWidget {
  const CaptionInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 4,
      minLines: 1,
      style: const TextStyle(color: AppColor.white, fontSize: 17),
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          filled: true,
          fillColor: AppColor.grey,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none),
          hintText: "Add Caption...",
          hintStyle: const TextStyle(color: AppColor.white, fontSize: 17),
          prefixIcon: const Icon(Icons.add_photo_alternate,
              color: AppColor.white, size: 27)),
    );
  }
}
