import 'package:auto_route/annotations.dart';
import 'package:flutter_firebase/pages/chat/chat_page.dart';
import 'package:flutter_firebase/pages/home/home_page.dart';
import 'package:flutter_firebase/pages/login/login_page.dart';
import 'package:flutter_firebase/pages/signup/signup_page.dart';
import 'package:flutter_firebase/pages/splash/splash_page.dart';
import 'package:flutter_firebase/pages/user_info/user_info_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: LoginPage),
    AutoRoute(page: SignUpPage),
    AutoRoute(page: HomePage),
    AutoRoute(page: ChatPage),
    AutoRoute(page: UserInfoPage)
  ],
)
class $Routes {}