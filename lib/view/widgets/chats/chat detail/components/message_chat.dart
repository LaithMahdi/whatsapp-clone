import 'package:flutter/material.dart';
import '../../../../../core/constant/app_color.dart';
import '../../../../../core/constant/app_size.dart';
import '../../../../../core/function/transfer_date.dart';
import '../../../../../widgets/spacer/spacer.dart';

class MessageChat extends StatelessWidget {
  final String message;
  final DateTime date;
  final bool isSender;
  const MessageChat(
      {super.key,
      required this.isSender,
      required this.message,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        constraints: BoxConstraints(maxWidth: AppSize.screenWidth! - 60),
        decoration: BoxDecoration(
          color: isSender ? AppColor.green10 : AppColor.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
                color: Colors.grey, blurRadius: 1, offset: Offset(1, 0.5)),
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 60, 20),
              child: Text(
                message,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Positioned(
              bottom: 6,
              right: 10,
              child: isSender
                  ? Row(
                      children: [
                        Text(
                          transferDate(date),
                          style:
                              TextStyle(fontSize: 13, color: AppColor.grey600),
                        ),
                        const HorizintalSpacer(0.5),
                        const Icon(Icons.done_all, size: 18)
                      ],
                    )
                  : Text(
                      transferDate(date),
                      style: TextStyle(fontSize: 13, color: AppColor.grey600),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
