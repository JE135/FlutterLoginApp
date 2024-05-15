import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:loginapp/models/user.dart';

class CreateAccountScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                final username = usernameController.text;
                final password = passwordController.text;
                var box = await Hive.openBox<User>('users');
                box.put(username, User(username, password));
                Navigator.pop(context); // Go back to previous screen
              },
              child: Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}
