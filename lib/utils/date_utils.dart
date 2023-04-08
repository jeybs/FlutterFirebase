import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class MyDateUtils {

  static String formatTimestamp(Timestamp timestamp) {
    var format = DateFormat('yyyy-MM-dd H:m:s');
    return format.format(timestamp.toDate());
  }

  static DateTime formatTimeStampToDateTime(Timestamp timestamp) {
    var format = DateFormat('yyyy-M-dd H:m:s'); //
    String newFormat = format.format(timestamp.toDate());

    return DateFormat('yyyy-M-dd H:m:s').parse(newFormat);
  }

  static String getTimeDiff(String dateTime) {
    DateTime input = DateFormat('yyyy-MM-dd H:mm:ss').parse(dateTime, false);
    Duration diff = DateTime.now().difference(input);

    if (diff.inDays >= 1) {
      return '${diff.inDays} day${diff.inDays == 1 ? '' : 's'} ago';
    } else if (diff.inHours >= 1) {
      return '${diff.inHours} hr${diff.inHours == 1 ? '' : 's'} ago';
    } else if (diff.inMinutes >= 1) {
      return '${diff.inMinutes} min${diff.inMinutes == 1 ? '' : 's'} ago';
    } else if (diff.inSeconds >= 1) {
      return '${diff.inSeconds} sec${diff.inSeconds == 1 ? '' : 's'} ago';
    } else {
      return 'just now';
    }
  }
}