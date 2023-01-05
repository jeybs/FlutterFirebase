import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/config/routes.gr.dart';
import 'package:flutter_firebase/pages/login/login_page.dart';

class MyApp extends StatelessWidget {

  final _appRoutes = Routes();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: kDebugMode,
      routerDelegate: _appRoutes.delegate(),
      routeInformationParser: _appRoutes.defaultRouteParser(),
    );
  }
}
