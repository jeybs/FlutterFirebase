import 'package:auto_route/auto_route.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/config/routes.gr.dart';
import 'package:flutter_firebase/models/contact_data/contact.dart';
import 'package:flutter_firebase/models/user_data/user_data.dart';

class ContactListComponent extends StatefulWidget {

  final List<Contact> contactList;
  final UserData userData;

  const ContactListComponent({Key? key, required this.contactList, required this.userData}) : super(key: key);

  @override
  State<ContactListComponent> createState() => _ContactListComponentState();
}

class _ContactListComponentState extends State<ContactListComponent> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: widget.contactList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            //context.router.push(ChatRoute(userData: widget.userData, contactData: widget.contactList[index].userData!));
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
            child: contactItem(widget.contactList[index]),
          ),
        );
      },
    );
  }

  Widget contactItem(Contact contact) {
    return Column(
      children: [
        SizedBox(
          height: 60.0,
          width: 60.0,
          child: profileImage(contact),
        ),
        const SizedBox(height: 8.0,),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            contact.userData!.name.split(" ")[0],
            style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black
            ),
          ),
        )
      ],
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
