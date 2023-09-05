import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import '../../core/constant/app_size.dart';

class CustomEmoji extends StatelessWidget {
  final void Function(Category? category, Emoji? emoji) onEmojiSelected;
  const CustomEmoji({super.key, required this.onEmojiSelected});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.screenHeight! * .35,
      child: EmojiPicker(onEmojiSelected: onEmojiSelected),
    );
  }
}
