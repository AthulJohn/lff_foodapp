import 'package:get_storage/get_storage.dart';

abstract class GetXStorageManager {
  static GetStorage box = GetStorage();

  static Future<bool> initStorage() async {
    return await GetStorage.init();
  }

  static void saveUserStatus(String status) {
    box.write("Status", status);
  }

  static String? getUserStatus() {
    return box.read("Status");
  }
}
