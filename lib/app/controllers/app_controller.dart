import 'package:get/get.dart';
import '/app/repositories/settings_repository.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppController extends GetxController {
  var appVersion = ''.obs;
  var buildNumber = ''.obs;
  var dbVersion = ''.obs;

  @override
  onReady() {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      appVersion.value = packageInfo.version;
      buildNumber.value = packageInfo.buildNumber;
      print('Version: $appVersion, build: $buildNumber.');
    });
    final fb = Firestore();
    fb.getDBVersion().then((value) {
      print('Database version: $value.');
      dbVersion.value = value;
    });
  }
}
