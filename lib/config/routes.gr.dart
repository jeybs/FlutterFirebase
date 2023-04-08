// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../models/contact_data/contact.dart' as _i9;
import '../models/user_data/user_data.dart' as _i10;
import '../pages/chat/chat_page.dart' as _i5;
import '../pages/home/home_page.dart' as _i4;
import '../pages/login/login_page.dart' as _i2;
import '../pages/signup/signup_page.dart' as _i3;
import '../pages/splash/splash_page.dart' as _i1;
import '../pages/user_info/user_info_page.dart' as _i6;

class Routes extends _i7.RootStackRouter {
  Routes([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.LoginPage(key: args.key),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.SignUpPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.HomePage(),
      );
    },
    ChatRoute.name: (routeData) {
      final args = routeData.argsAs<ChatRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.ChatPage(
          key: args.key,
          contact: args.contact,
        ),
      );
    },
    UserInfoRoute.name: (routeData) {
      final args = routeData.argsAs<UserInfoRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.UserInfoPage(
          key: args.key,
          userData: args.userData,
        ),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i7.RouteConfig(
          LoginRoute.name,
          path: '/login-page',
        ),
        _i7.RouteConfig(
          SignUpRoute.name,
          path: '/sign-up-page',
        ),
        _i7.RouteConfig(
          HomeRoute.name,
          path: '/home-page',
        ),
        _i7.RouteConfig(
          ChatRoute.name,
          path: '/chat-page',
        ),
        _i7.RouteConfig(
          UserInfoRoute.name,
          path: '/user-info-page',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i8.Key? key})
      : super(
          LoginRoute.name,
          path: '/login-page',
          args: LoginRouteArgs(key: key),
        );

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.SignUpPage]
class SignUpRoute extends _i7.PageRouteInfo<void> {
  const SignUpRoute()
      : super(
          SignUpRoute.name,
          path: '/sign-up-page',
        );

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home-page',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.ChatPage]
class ChatRoute extends _i7.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    _i8.Key? key,
    required _i9.Contact contact,
  }) : super(
          ChatRoute.name,
          path: '/chat-page',
          args: ChatRouteArgs(
            key: key,
            contact: contact,
          ),
        );

  static const String name = 'ChatRoute';
}

class ChatRouteArgs {
  const ChatRouteArgs({
    this.key,
    required this.contact,
  });

  final _i8.Key? key;

  final _i9.Contact contact;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key, contact: $contact}';
  }
}

/// generated route for
/// [_i6.UserInfoPage]
class UserInfoRoute extends _i7.PageRouteInfo<UserInfoRouteArgs> {
  UserInfoRoute({
    _i8.Key? key,
    required _i10.UserData userData,
  }) : super(
          UserInfoRoute.name,
          path: '/user-info-page',
          args: UserInfoRouteArgs(
            key: key,
            userData: userData,
          ),
        );

  static const String name = 'UserInfoRoute';
}

class UserInfoRouteArgs {
  const UserInfoRouteArgs({
    this.key,
    required this.userData,
  });

  final _i8.Key? key;

  final _i10.UserData userData;

  @override
  String toString() {
    return 'UserInfoRouteArgs{key: $key, userData: $userData}';
  }
}
