import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant/app_color.dart';
import 'package:flutter_firebase/constant/app_fonts.dart';
import 'package:flutter_firebase/models/contact_data/contact.dart';
import 'package:flutter_firebase/models/message.dart';
import 'package:flutter_firebase/ui/appbar/primary_appbar.dart';
import 'package:flutter_firebase/ui/buttons/primary_button.dart';
import 'package:flutter_firebase/ui/buttons/submit_button.dart';
import 'package:flutter_firebase/ui/textfields/default_textfield.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatefulWidget {

  final Contact contact;

  const ChatPage({Key? key, required this.contact}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  List<Message> messageList = [];

  @override
  void initState() {
    for(var i = 1; i <= 10; i++) {
      late Message _message;
      if(i.isEven) {
        _message = Message(senderId: "1", receiverId: "2", message: "Message ${DateTime.now().millisecondsSinceEpoch}", date_created: DateTime(2023, 1, i));
      } else {
        _message = Message(senderId: "2", receiverId: "1", message: "Message", date_created: DateTime(2023, 1, i));
      }

      messageList.add(_message);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppbar.getDefaultAppBar(context, widget.contact.userData!.name),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: GroupedListView<Message, DateTime>(
                reverse: true,
                padding: const EdgeInsets.all(8.0),
                order: GroupedListOrder.DESC,
                elements: messageList,
                groupBy: (message) => DateTime(
                  message.date_created!.year,
                  message.date_created!.month,
                  message.date_created!.day
                ),
                groupHeaderBuilder: (message) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    height: 40.0,
                    child: Center(
                      child: Card(
                        color: AppColor.primaryColor,
                        child:  Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                              DateFormat.yMMMd().format(message.date_created!),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontFamily: AppFonts.sfuitextregular
                              )
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemBuilder: (context, Message message) {
                  return Align(
                    alignment: int.parse(message.receiverId).isEven ? Alignment.centerRight : Alignment.centerLeft,
                    child: Card(
                      elevation: 8,
                      child:  Container(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                            message.message
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: DefaultTextField(
                        label: 'Message',
                        onTextChanged: (value) {

                        },
                        isPasswordField: false,
                      isMultiLine: true,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: IconButton(
                      icon: Icon(Icons.send, color: AppColor.primaryColor, size: 30.0,),
                      onPressed: () {
                        print("Send");
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
