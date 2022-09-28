import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/auth_controller.dart';
import '../data/api_client.dart';
import '../data/repository/auth_repo.dart';
import '../utils/app_constants.dart';

Future<void> init() async{
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);

  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  Get.lazyPut(() => AuthController(authRepo: Get.find()));
}