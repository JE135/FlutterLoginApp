import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loginapp/models/user.dart';
import 'package:loginapp/screens/login_screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter()); // Register UserAdapter for User model
  await Hive.openBox<User>('users');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(), // Set LoginScreen as the home page
    );
  }
}
