import 'package:crypto_tracker/models/user_model/user.dart';

class UserModel extends User {
  UserModel.fromJson(Map<String, String> user) {
    uuid = user['uuid'];
    phoneNumber = user['phone'];
  }
}
