import 'package:flutter/material.dart';
import 'package:schooler_app/models/messages_model.dart';

class ChatBubleForAFriend extends StatelessWidget {
  const ChatBubleForAFriend({
    super.key,
    required this.message,
  });
  final Messages message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 16),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32),
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
          color: Color(0xff006D84),
        ),
        child:  Text(
          message.message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
