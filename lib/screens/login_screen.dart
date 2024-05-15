import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:loginapp/models/user.dart';
import 'package:loginapp/screens/welcome_screen.dart';
import 'package:loginapp/screens/create_account_screen.dart'; // Import the CreateAccountScreen

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
                var user = box.get(username);
                if (user != null && user.password == password) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => WelcomeScreen()),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Error'),
                      content: Text('Invalid username or password.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Text('Login'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) =>
                          CreateAccountScreen()), // Navigate to CreateAccountScreen
                );
              },
              child: Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}
