import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/constant/app_color.dart';
import 'package:whatsapp_clone/core/constant/app_image.dart';
import 'package:whatsapp_clone/widgets/spacer/spacer.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const VerticalSpacer(1),
          const OurStatus(),
          const Padding(
            padding: EdgeInsets.only(left: 13, bottom: 7, top: 7),
            child: Text(
              "Recent updates",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
          const OtherStatus(
              image: AppImage.person2,
              name: "zouhour",
              time: "Today at, 01:23"),
          const OtherStatus(
              image: AppImage.person3,
              name: "zouhour",
              time: "Today at, 00:57"),
          const OtherStatus(
              image: AppImage.person4,
              name: "zouhour",
              time: "Today at, 00:05"),
          Divider(color: AppColor.blueGrey200.withOpacity(0.2)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock, size: 15, color: AppColor.blueGrey),
              const HorizintalSpacer(0.5),
              Text.rich(TextSpan(
                  text: "Your status updates are ",
                  style: TextStyle(
                      color: AppColor.blueGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                  children: [
                    TextSpan(
                        text: "end-to-end encrypted",
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        style: const TextStyle(
                            color: AppColor.second,
                            fontSize: 12,
                            fontWeight: FontWeight.w600))
                  ])),
            ],
          )
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: FloatingActionButton(
              backgroundColor: Colors.teal.shade100,
              elevation: 8,
              onPressed: () {},
              child: const Icon(Icons.edit, color: AppColor.primary),
            ),
          ),
          const SizedBox(height: 13),
          FloatingActionButton(
            elevation: 5,
            onPressed: () {},
            child: const Icon(Icons.camera_alt_rounded, color: AppColor.white),
          ),
        ],
      ),
    );
  }
}

class OurStatus extends StatelessWidget {
  const OurStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Stack(
        children: [
          CircleAvatar(
            radius: 27,
            backgroundColor: AppColor.white,
            backgroundImage: AssetImage(AppImage.person1),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                radius: 15,
                backgroundColor: AppColor.white,
                child: CircleAvatar(
                    radius: 12,
                    backgroundColor: AppColor.second,
                    child: Icon(Icons.add, size: 20, color: AppColor.white)),
              ))
        ],
      ),
      title: const Text("My Status",
          style: TextStyle(fontWeight: FontWeight.bold, color: AppColor.black)),
      subtitle: Text("Tap to add status update",
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.normal,
              color: AppColor.grey600)),
    );
  }
}

class OtherStatus extends StatelessWidget {
  final String image;
  final String name;
  final String time;
  const OtherStatus(
      {super.key, required this.image, required this.name, required this.time});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 26,
        backgroundColor: AppColor.white,
        backgroundImage: AssetImage(image),
      ),
      title: Text(name,
          style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColor.black)),
      subtitle: Text(time,
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.normal,
              color: AppColor.grey600)),
    );
  }
}
