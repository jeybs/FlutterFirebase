
import 'package:auto_route/auto_route.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/config/routes.gr.dart';
import 'package:flutter_firebase/constant/app_fonts.dart';
import 'package:flutter_firebase/models/contact_data/contact.dart';

class MessageListComponent extends StatefulWidget {

  final List<Contact> contactList;

  const MessageListComponent({Key? key, required this.contactList}) : super(key: key);

  @override
  State<MessageListComponent> createState() => _MessageListComponentState();
}

class _MessageListComponentState extends State<MessageListComponent> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.contactList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            context.router.push(ChatRoute(userData: widget.contactList[index].userData!));
          },
          child: messageItem(widget.contactList[index]),
        );
      },
    );
  }

  Widget messageItem(Contact contact) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Row(
        children: [
          Container(
            width: 60.0,
            height: 60.0,
            child: profileImage(contact),
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
                    contact.userData!.name,
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontFamily: AppFonts.sfuitextmedium
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  "No message",
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                    fontFamily: AppFonts.sfuitextregular,
                  ),
                ),
              ],
            ),
          ),
          if("Date".isNotEmpty) Container(
            alignment: Alignment.centerRight,
            child: Text(
              "12/14",
              style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                  fontFamily: AppFonts.sfuitextregular
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget profileImage(Contact contact) {
    if(contact.userData!.photo.isNotEmpty) {
      return ExtendedImage.network(
        contact.userData!.photo,
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
