import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_firebase/utils/sharedprefs_utils.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationService {

  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final SharedPrefsUtils sharedPrefsUtils = SharedPrefsUtils();

  Future initialize() async {

    var initializationSettingsAndroid = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOs = const DarwinInitializationSettings();
    var initSetttings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOs);

    flutterLocalNotificationsPlugin.initialize(initSetttings);

    if(Platform.isIOS) {

      _fcm.setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);
    }

    _fcm.requestPermission();
    
    _fcm.getToken().then((token){
      print("Token => ${token}");
      sharedPrefsUtils.saveDeviceId(token!);
    });


    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {

      if(message != null && message.data != null) {
        //await showNotification(message.data);
      }

    });


    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    // _fcm.configure(
    //   onMessage: (Map<String, dynamic> message) async {
    //     // Called when the app is in the foreground and we receive a push notification
    //     print('onMessage: $message');
    //     await showNotification(message);
    //   },
    //   onLaunch: (Map<String, dynamic> message) async {
    //     // Called when the app has been closed comlpetely and it's opened
    //     // from the push notification.
    //     print('onLaunch: $message');
    //   },
    //   onResume: (Map<String, dynamic> message) async {
    //     // Called when the app is in the background and it's opened
    //     // from the push notification.
    //     print('onResume: $message');
    //   }
    // );
  }

  Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {

  }

  Future<dynamic> onNotificationClick(String? payload) {
    return showNotification(jsonDecode(payload!));
  }

  showNotification(Map message) async {
    var random = Random();
    var id = DateTime.now().millisecondsSinceEpoch;
    var notifId = random.nextInt(100000);
    // var android = AndroidNotificationDetails(
    //     id.toString(), 'notification', 'notification_receving',
    //     priority: Priority.high, importance: Importance.max,
    //     icon: '@mipmap/icon_launcher_fill');

    var android = AndroidNotificationDetails(id.toString(), 'notification', channelDescription: 'notification_receving', priority: Priority.high, importance: Importance.max,
        icon: '@mipmap/icon_launcher_fill');
    var iOS = const DarwinNotificationDetails();
    var platform = NotificationDetails(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin.show(
        notifId, message['title'], message['body'], platform,
        payload: jsonEncode(message));
  }

}