import 'package:get_storage/get_storage.dart';
import 'package:lff_foodapp/models/user_class.dart';

enum UserStatus { none, onBoarded, signedup, registered, approved, signedout }

const Map<String, UserStatus> statusStrings = {
  "onBoarded": UserStatus.onBoarded,
  "signedup": UserStatus.signedup,
  "registered": UserStatus.registered,
  "approved": UserStatus.approved,
  "signedout": UserStatus.signedout,
};

const Map<UserStatus, String> stringStatuses = {
  UserStatus.onBoarded: "onBoarded",
  UserStatus.signedup: "signedup",
  UserStatus.registered: "registered",
  UserStatus.approved: "approved",
  UserStatus.none: "onBoarded",
  UserStatus.signedout: "signedout",
};

abstract class GetXStorageManager {
  static GetStorage box = GetStorage();

  static Future<bool> initStorage() async {
    return await GetStorage.init();
  }

  static void saveUserStatus(UserStatus status) {
    box.write("Status", stringStatuses[status]);
  }

  static UserStatus? getUserStatus() {
    return statusStrings[box.read("Status")] ?? UserStatus.none;
  }
}
