

import 'package:flutter_firebase/services/push_notification_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton(() => PushNotificationService());
}