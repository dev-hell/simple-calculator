import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tasking/pages/dashboard.dart';
import 'package:tasking/pages/forgat_password.dart';
import 'package:tasking/pages/new_tag.dart';
import 'package:tasking/pages/new_task.dart';
import 'package:tasking/pages/notifications.dart';
import 'package:tasking/pages/settings.dart';
import 'package:tasking/pages/sign_in.dart';
import 'package:tasking/pages/sign_up.dart';

void main()async {
    // Initialize Firebase app
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    // Run your app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Tasks Material App',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple),
      initialRoute: '/sign_in',
      routes: {
        '/sign_in': (context) =>  SignIn(),
        '/sign_up': (context) =>  SignUp(),
        '/forget_password': (context) =>  ForgatPassword(),
        '/dashboard': (context) =>  Dashboard(),
        '/notifications': (context) =>  Notifications(),
        '/settings': (context) =>  Settings(),
        '/new_task': (context) => NewTask(),
        '/new_tag': (context) =>  NewTag(),
      },
    );
  }
}



