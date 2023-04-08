import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class MyDateUtils {

  static String formatTimestamp(Timestamp timestamp) {
    var format = new DateFormat('y-M-d'); // <- use skeleton here
    return format.format(timestamp.toDate());
  }

}