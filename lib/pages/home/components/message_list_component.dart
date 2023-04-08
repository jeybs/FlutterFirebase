
import 'package:auto_route/auto_route.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/config/routes.gr.dart';
import 'package:flutter_firebase/constant/app_fonts.dart';
import 'package:flutter_firebase/models/contact_data/contact.dart';
import 'package:flutter_firebase/models/message_room/message_room.dart';
import 'package:flutter_firebase/models/user_data/user_data.dart';
import 'package:flutter_firebase/utils/date_utils.dart';

class MessageListComponent extends StatefulWidget {

  final List<MessageRoom> messageRoomList;
  final UserData userData;

  const MessageListComponent({Key? key, required this.messageRoomList, required this.userData}) : super(key: key);

  @override
  State<MessageListComponent> createState() => _MessageListComponentState();
}

class _MessageListComponentState extends State<MessageListComponent> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.messageRoomList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            context.router.push(ChatRoute(roomId: widget.messageRoomList[index].roomId, receiverRoomId: widget.messageRoomList[index].receiverRoomId,
                userData: widget.userData, contactData: widget.messageRoomList[index].userData!));
          },
          child: messageItem(widget.messageRoomList[index]),
        );
      },
    );
  }

  Widget messageItem(MessageRoom messageRoom) {
    print("message room => ${messageRoom.isRead}");
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Row(
        children: [
          Container(
            width: 60.0,
            height: 60.0,
            child: profileImage(messageRoom),
          ),
          const SizedBox(width: 10.0,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    messageRoom.userData!.name,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontFamily: AppFonts.sfuitextmedium
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  messageRoom.lastMessage.isNotEmpty ? messageRoom.lastMessage : messageRoom.attachment.isNotEmpty ? "Attachment" : "No message",
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: messageRoom.isRead ? Colors.grey[600] : Colors.black,
                    fontWeight: messageRoom.isRead ? FontWeight.normal : FontWeight.bold,
                    fontFamily: AppFonts.sfuitextregular,
                  ),
                ),
              ],
            ),
          ),
          if(messageRoom.lastMessageDate.isNotEmpty) Container(
            alignment: Alignment.centerRight,
            child: Text(
              MyDateUtils.getTimeDiff(messageRoom.lastMessageDate),
              style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: AppFonts.sfuitextregular
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget profileImage(MessageRoom messageRoom) {
    if(messageRoom.userData!.photo.isNotEmpty) {
      return ExtendedImage.network(
        messageRoom.userData!.photo,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fitWidth,
        cache: true,
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.all(Radius.circular(60.0)),
      );
    } else {
      return ExtendedImage.asset(
          'assets/icon_profile_loading.jpg',
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(60.0))
      );
    }
  }
}
