import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as Io;
import 'package:whatsapp_clone/data/model/message_model.dart';
import '../../data/model/chat_model.dart';

abstract class ChatDetailController extends GetxController {}

class ChatDetailControllerImpl extends ChatDetailController {
  late ChatModel _chat;
  late bool _isEmojiShow;
  late String _popMenu;
  late FocusNode _focusNode;
  late TextEditingController _message;
  late ScrollController _scrollController;
  late Io.Socket socket;
  bool _isSend = false;
  late ChatModel _sender;
  final List<MessageModel> _messages = [];
  final List<String> _popMenuItems = [
    "View contact",
    "Media, links, and docs",
    "Mute notifications",
    "Disappearing messages",
    "Wallpaper",
    "More"
  ];
  //Getter
  ChatModel get chat => _chat;
  List<MessageModel> get messages => _messages;
  bool get isEmojiShow => _isEmojiShow;
  String get popMenu => _popMenu;
  FocusNode get focusNode => _focusNode;
  TextEditingController get message => _message;
  List<String> get popMenuItems => _popMenuItems;
  List<Map<String, dynamic>> get bottomSheetItems => _bottomSheetItems;
  bool get isSend => _isSend;
  ScrollController get scrollController => _scrollController;
  //
  final List<Map<String, dynamic>> _bottomSheetItems = [
    {
      "icon": Icons.insert_drive_file,
      "text": "Document",
      "color": Colors.indigo,
      "function": () {},
    },
    {
      "icon": Icons.camera_alt,
      "text": "Camera",
      "color": Colors.pink,
      "function": () {},
    },
    {
      "icon": Icons.insert_photo,
      "text": "Gallery",
      "color": Colors.purple,
      "function": () {},
    },
    {
      "icon": Icons.headset,
      "text": "Audio",
      "color": Colors.orange,
      "function": () {},
    },
    {
      "icon": Icons.location_pin,
      "text": "Location",
      "color": Colors.pink,
      "function": () {},
    },
    {
      "icon": Icons.person,
      "text": "Contact",
      "color": Colors.blue,
      "function": () {},
    },
  ];
  @override
  void onInit() {
    _focusNode = FocusNode();
    _sender = Get.arguments["sender"];
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _isEmojiShow = false;
        update();
      }
    });
    _isEmojiShow = false;
    _chat = Get.arguments["chat"];
    _popMenu = popMenuItems.first;
    _message = TextEditingController();
    _scrollController = ScrollController();
    connectSocket();
    super.onInit();
  }

  selectPopMenu(String? value) {
    _popMenu = value!;
  }

  showEmojiKeyborad() {
    _focusNode.unfocus();
    _focusNode.canRequestFocus = false;
    _isEmojiShow = !_isEmojiShow;
    update();
  }

  back() => Get.back();

  void onEmojiSelected(Category? category, Emoji? emoji) {
    _message.text += emoji!.emoji;
    update();
  }

  Future<bool> onWillPop() {
    if (_isEmojiShow) {
      _isEmojiShow = false;
      update();
    } else {
      Get.back();
    }
    return Future.value(false);
  }

  void connectSocket() {
    Map<String, dynamic> options = {
      "transports": ['websocket'],
      "autoConnect": false
    };
    socket = Io.io("http://192.168.1.103:8080/", options);
    socket.connect();
    socket.onConnect((data) {
      print("user connected");
      socket.on("msg", (msg) {
        print(msg);
        setMessage(msg["message"], "destination");
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
        update();
      });
    });
    socket.emit("login", _sender.id);
  }

  sendMessge() {
    setMessage(message.text, "sender");
    if (_isSend) {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
      socket.emit("msg", {
        "message": message.text,
        "sender": _sender.id,
        "destination": _chat.id
      });
      message.clear();
      _isSend = false;
    }
  }

  setMessage(String message, String type) {
    MessageModel msg =
        MessageModel(message: message, type: type, date: DateTime.now());
    messages.add(msg);
    update();
  }

  changeMessageToVoice(String value) {
    value.isNotEmpty ? _isSend = true : _isSend = false;
    update();
  }
}
