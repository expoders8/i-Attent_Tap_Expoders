import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../config/constant/constant.dart';
import '../../config/provider/loader_provider.dart';
import '../../config/provider/snackbar_provider.dart';
import '../routes/app_pages.dart';

class AuthService {
  // Future<LoginModel>
  login(String organizationId, String username, String password) async {
    Get.toNamed(Routes.tabPage);

    // LoaderX.hide();
    // try {
    //   var response = await http.post(Uri.parse('$baseUrl/api/Auth/Login'),
    //       body: json.encode({
    //         "email": organizationId,
    //         "password": username,
    //         "fcmToken": password
    //       }),
    //       headers: {'Content-type': 'application/json'});
    //   if (response.statusCode == 200) {
    //     var decodedUser = jsonDecode(response.body);
    //     var userObj = decodedUser["data"];
    //     if (userObj != null && decodedUser["success"]) {
    //       // getStorage.write('user', jsonEncode(decodedUser["data"]));
    //       // getStorage.write('authToken', decodedUser["data"]['authToken']);
    //       // Get.toNamed(Routes.tabPage);
    //     }
    //     return [];
    //   } else {
    //     // LoaderX.hide();
    //     SnackbarUtils.showErrorSnackbar("Server Error",
    //         "Error while user login, Please try after some time.");
    //     return Future.error("Server Error");
    //   }
    // } catch (e) {
    //   // LoaderX.hide();
    //   SnackbarUtils.showErrorSnackbar("Failed to login", e.toString());
    //   throw e.toString();
    // }
  }
}
