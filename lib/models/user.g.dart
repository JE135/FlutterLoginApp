// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = userTypeId; // Use the constant for typeId

  @override
  User read(BinaryReader reader) {
    String username = reader.readString();
    String password = reader.readString();
    return User(username, password);
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer.writeString(obj.username);
    writer.writeString(obj.password);
  }
}
