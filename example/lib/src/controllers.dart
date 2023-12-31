import 'package:get/get.dart';

import 'constants.dart';

class ApiProcessorController extends GetxController {
  static Future<dynamic> errorState(data) async {
    try {
      if (data.statusCode == 200) {
        return data.body;
      }
      // errorSnack("Something went wrong");
      return;
    } catch (e) {
      // errorSnack("Check your internet and try again");
      return;
    }
  }

  static void errorSnack(msg) {
    Get.showSnackbar(GetSnackBar(
      title: "ERROR",
      message: "$msg",
      backgroundColor: kErrorColor,
      duration: const Duration(seconds: 2),
    ));
  }

  static void successSnack(msg) {
    Get.showSnackbar(GetSnackBar(
      title: "Successful",
      message: "$msg",
      backgroundColor: kSuccessColor,
      duration: const Duration(seconds: 2),
    ));
  }
}
