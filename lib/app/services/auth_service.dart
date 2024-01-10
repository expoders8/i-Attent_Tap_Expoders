import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../ui/home/tab_page.dart';
import '../../config/constant/constant.dart';
import '../../config/provider/loader_provider.dart';
import '../../config/provider/snackbar_provider.dart';

class AuthService {
  // Future<LoginModel>
  login(String organizationId, String email, String password,
      String fcmToken) async {
    try {
      var response = await http.post(
          Uri.parse('$baseUrl/api/Authentication/Login'),
          body: json.encode({
            "orgID": organizationId,
            "email": email,
            "password": password,
            "fcmToken": ""
          }),
          headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200) {
        var decodedUser = jsonDecode(response.body);
        var userObj = decodedUser["data"];
        // await FirebaseAuthServices()
        //     .signUp(organizationId, email.toLowerCase(), password);
        if (userObj != null && decodedUser["success"]) {
          getStorage.write('user', jsonEncode(decodedUser["data"]));
          getStorage.write('authToken', decodedUser["data"]['authToken']);
          getStorage.write('onBoard', 1);
          LoaderX.hide();
          Get.offAll(() => const TabPage());
        }
      } else {
        LoaderX.hide();
        SnackbarUtils.showErrorSnackbar("Server Error",
            "Error while user login, Please try after some time.");
        return Future.error("Server Error");
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Failed to login", e.toString());
      throw e.toString();
    }
  }
}
