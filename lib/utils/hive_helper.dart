import 'package:hive/hive.dart';
import 'package:loginapp/models/user.dart'; // Import the User class from user.dart

class HiveHelper {
  static Future<Box<User>> openUserBox() async {
    return await Hive.openBox<User>('users');
  }
}
