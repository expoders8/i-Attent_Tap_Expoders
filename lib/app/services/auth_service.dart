import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confrance_expoders/app/services/firebase_auth_service.dart';

import '../ui/home/tab_page.dart';
import '../../config/constant/constant.dart';
import '../../config/provider/loader_provider.dart';
import '../../config/provider/snackbar_provider.dart';

class AuthService {
  // Future<LoginModel>
  Future<bool> doesUserExist(String userId) async {
    // Assuming you have a Firebase reference to the user's collection
    // Replace 'users' with the actual path to your user collection
    var userRef = FirebaseFirestore.instance.collection('users');

    var query = await userRef.where('uid', isEqualTo: userId).get();

    return query.docs.isNotEmpty;
  }

  login(String organizationId, String email, String password,
      String fcmToken) async {
    try {
      var response =
          await http.post(Uri.parse('$baseUrl/api/Authentication/Login'),
              body: json.encode({
                "orgID": organizationId,
                "email": email,
                "password": password,
                "fcmToken": fcmToken
              }),
              headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200) {
        var decodedUser = jsonDecode(response.body);
        var userObj = decodedUser["data"];
        await FirebaseAuthServices()
            .signUp(organizationId, email, password, userObj['id'].toString());
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
