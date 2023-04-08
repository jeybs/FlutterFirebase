import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/constant/app_color.dart';
import 'package:flutter_firebase/constant/app_fonts.dart';
import 'package:flutter_firebase/models/contact_data/contact.dart';
import 'package:flutter_firebase/models/message/message.dart';
import 'package:flutter_firebase/models/user_data/user_data.dart';
import 'package:flutter_firebase/pages/chat/chat_cubit.dart';
import 'package:flutter_firebase/ui/appbar/primary_appbar.dart';
import 'package:flutter_firebase/ui/buttons/primary_button.dart';
import 'package:flutter_firebase/ui/buttons/submit_button.dart';
import 'package:flutter_firebase/ui/textfields/default_textfield.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatefulWidget {

  final UserData userData;
  final UserData contactData;
  final String roomId;
  final String receiverRoomId;

  const ChatPage({Key? key, required this.userData, required this.contactData, required this.roomId, required this.receiverRoomId}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  String message = "";
  ChatCubit? cubit;
  List<Message> messageList = [];
  String roomId = "";

  @override
  void initState() {
    // for(var i = 1; i <= 10; i++) {
    //   late Message _message;
    //   if(i.isEven) {
    //     _message = Message(fromId: "1", toId: "2", message: "Message ${DateTime.now().millisecondsSinceEpoch}", messageDate: DateTime(2023, 1, i));
    //   } else {
    //     _message = Message(fromId: "2", toId: "1", message: "Message", messageDate: DateTime(2023, 1, i));
    //   }
    //
    //   messageList.add(_message);
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppbar.getDefaultAppBar(context, widget.userData.name),
      body: Container(
        child: BlocProvider(
          create: (context) => ChatCubit(),
          child: BlocConsumer<ChatCubit, ChatState>(
            listener: (context, state) {
              if(state is MessageLoaded) {
                messageList = state.messageList;
              }
            },
            builder: (context, state) {
              if(cubit == null) {
                cubit = context.read<ChatCubit>();
                //cubit?.loadProfile();
                cubit?.getMessages(widget.userData.uid, widget.contactData.uid, widget.roomId);
              }

              return mainBody();
            },
          ),
        ),
      ),
    );
  }

  Widget mainBody() {
    return Column(
      children: [
        Expanded(
          child: GroupedListView<Message, DateTime>(
            reverse: true,
            padding: const EdgeInsets.all(8.0),
            order: GroupedListOrder.DESC,
            elements: messageList,
            groupBy: (message) => DateTime(
                message.messageDate!.year,
                message.messageDate!.month,
                message.messageDate!.day
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
                          DateFormat.yMMMd().format(message.messageDate!),
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
                alignment: int.parse(message.fromId).isEven ? Alignment.centerRight : Alignment.centerLeft,
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
                    setState(() {
                      message = value;
                    });
                  },
                  isPasswordField: false,
                  isMultiLine: true,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: IconButton(
                  icon: Icon(Icons.send, color: message.isNotEmpty ? AppColor.primaryColor : Colors.grey, size: 30.0,),
                  onPressed: () {
                    if(message.isNotEmpty) {
                      // Send message
                      cubit?.sendMessage(message, widget.userData.uid, widget.contactData.uid, widget.roomId, widget.receiverRoomId);
                    }
                  },
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
