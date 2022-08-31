import 'package:estore_admin_panel/view/widgets/chat_container.dart';
import 'package:estore_admin_panel/view/widgets/chat_message_field.dart';
import 'package:estore_admin_panel/view/widgets/small_text.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileChatScreen extends StatelessWidget {
  const MobileChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController msgController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios, color: Theme.of(context).primaryColorLight)),
        title: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                borderRadius: BorderRadius.circular(40/2)
              )
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: SmallText(text: 'Ahmed Azami'),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const ChatContainer(
              text: 'Hello Good morning',
              isCustomer: false,
            ),
            const ChatContainer(
              text: 'I am a customer service is there anything I can help you with?',
              isCustomer: false,
            ),
            const ChatContainer(
              text: 'Hi I having problems with my orders',
              isCustomer: true,
            ),
            const ChatContainer(
              text: 'Can you help me?',
              isCustomer: true,
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: ChatMessageField(
                    type: TextInputType.text,
                    controller: msgController,
                    bgColor: Theme.of(context).backgroundColor,
                    hint: 'Type your message...',
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: 60,
                  width : 60,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: (){},
                      child: Icon(
                        EvaIcons.paperPlane,
                        color: Theme.of(context).scaffoldBackgroundColor
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        )
      ),
    );
  }
}