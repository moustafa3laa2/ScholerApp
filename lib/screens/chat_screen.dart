import 'package:flutter/material.dart';
import 'package:schooler_app/constants.dart';
import 'package:schooler_app/models/messages_model.dart';
import 'package:schooler_app/widgets/chat_bubble_for_afriend.dart';
import 'package:schooler_app/widgets/chat_buble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  static String id = 'ChatScreen';
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    CollectionReference messages =
        FirebaseFirestore.instance.collection(kMessagesCollection);
    TextEditingController controller = TextEditingController();
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kSendedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Messages> messageList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messageList.add(
              Messages.fromJson(
                snapshot.data!.docs[i],
              ),
            );
          }

          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kPrimaaryColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    kLogo,
                    height: 50,
                  ),
                  const Text(
                    'Chat',
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: messageList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return messageList[index].id == email ? ChatBuble( message: messageList[index],): ChatBubleForAFriend(message: messageList[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (value) {
                      messages.add({
                        keyMessage: (value),
                        kSendedAt: DateTime.now(),
                        kID: email
                      });
                      controller.clear();
                      _controller.animateTo(0,
                          // _controller.position.maxScrollExtent,
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeOut);
                    },
                    decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.send,
                          color: kPrimaaryColor,
                        ),
                        hintText: 'Send Message',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                                const BorderSide(color: kPrimaaryColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: kPrimaaryColor,
                            ))),
                  ),
                )
              ],
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text(
                'Loading...',
              ),
            ),
          );
        }
      },
    );
  }
}
