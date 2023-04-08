import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class MyDateUtils {

  static String formatTimestamp(Timestamp timestamp) {
    var format = DateFormat('yyyy-MM-dd H:mm:ss'); // <- use skeleton here
    return format.format(timestamp.toDate());
  }

  static DateTime formatTimeStampToDateTime(Timestamp timestamp) {
    var format = DateFormat('yyyy-MM-dd H:mm:ss'); // <- use skeleton here
    String newFormat = format.format(timestamp.toDate());

    return DateFormat('yyyy-MM-dd H:mm:ss').parse(newFormat);
  }

  static String getTimeDiff(String dateTime) {
    DateTime input = DateFormat('yyyy-MM-dd H:mm:ss').parse(dateTime, true);
    Duration diff = DateTime.now().difference(input);

    if (diff.inDays >= 1) {
      return '${diff.inDays} day${diff.inDays == 1 ? '' : 's'} ago';
    } else if (diff.inHours >= 1) {
      return '${diff.inHours} hour${diff.inHours == 1 ? '' : 's'} ago';
    } else if (diff.inMinutes >= 1) {
      return '${diff.inMinutes} minute${diff.inMinutes == 1 ? '' : 's'} ago';
    } else if (diff.inSeconds >= 1) {
      return '${diff.inSeconds} second${diff.inSeconds == 1 ? '' : 's'} ago';
    } else {
      return 'just now';
    }
  }
}