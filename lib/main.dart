import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_firebase/myapp.dart';

import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // Initial env file
  await FlutterConfig.loadEnvVariables();

  // Initial Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}