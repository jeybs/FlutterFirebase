import 'package:auto_route/annotations.dart';
import 'package:flutter_firebase/pages/chat/chat_page.dart';
import 'package:flutter_firebase/pages/home/home_page.dart';
import 'package:flutter_firebase/pages/login/login_page.dart';
import 'package:flutter_firebase/pages/signup/signup_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LoginPage, initial: true),
    AutoRoute(page: SignUpPage),
    AutoRoute(page: HomePage),
    AutoRoute(page: ChatPage),
  ],
)
class $Routes {}