import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant/app_fonts.dart';
import 'package:flutter_firebase/models/contact_data/contact.dart';


class ContactListItem extends StatefulWidget {

  final Contact contact;

  const ContactListItem({Key? key, required this.contact}) : super(key: key);

  @override
  State<ContactListItem> createState() => _ContactListItemState();
}

class _ContactListItemState extends State<ContactListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Row(
        children: [
          Container(
            width: 65.0,
            child: profileImage(),
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
                    widget.contact.userData!.name,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontFamily: AppFonts.sfuitextmedium
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  widget.contact.lastMessage.isNotEmpty ? widget.contact.lastMessage : "No message",
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
          if(widget.contact.lastMessageDate.isNotEmpty) Container(
            alignment: Alignment.centerRight,
            child: Text(
              widget.contact.lastMessageDate,
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

  Widget profileImage() {
    if(widget.contact.userData!.photo.isNotEmpty) {
      return ExtendedImage.network(
        widget.contact.userData!.photo,
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
