import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant/app_fonts.dart';

class ContactListItem extends StatefulWidget {
  const ContactListItem({Key? key}) : super(key: key);

  @override
  State<ContactListItem> createState() => _ContactListItemState();
}

class _ContactListItemState extends State<ContactListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Row(
        children: [
          Container(
            width: 65.0,
            child: ExtendedImage.asset(
              'assets/icon_profile_loading.jpg',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10.0,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Joseph Bryan',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontFamily: AppFonts.sfuitextmedium
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Last message here Last ',
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
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              '4:30 PM',
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
}
