import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_fresh/app/app.dart';
import 'package:project_fresh/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}
