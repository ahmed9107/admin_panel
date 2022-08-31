import 'package:estore_admin_panel/data/static.dart';
import 'package:estore_admin_panel/view/widgets/chat_container.dart';
import 'package:estore_admin_panel/view/widgets/chat_message_field.dart';
import 'package:estore_admin_panel/view/widgets/user_info_detail.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController msgController = TextEditingController();
    return Row(
      children: [
        Container(
          width: 400.0,
          color: Theme.of(context).backgroundColor,
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: usersChatData.length,
              itemBuilder: (context, index) => UserInfoDetail(
                color: index == 5 ? Theme.of(context).scaffoldBackgroundColor : null,
                info: usersChatData[index],),
            ),
          ),
        ),
        Expanded(
          child: Container(
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
        ),
      ],
    );
  }
}