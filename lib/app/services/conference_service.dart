import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../config/constant/constant.dart';
import '../../config/provider/loader_provider.dart';
import '../../config/provider/snackbar_provider.dart';
import '../models/conference_model.dart';

class ConferenceService {
  Future<GetAllConferenceModel> getAllConferance() async {
    var data = getStorage.read('user');
    var getUserData = jsonDecode(data);
    try {
      var response = await http.get(
        Uri.parse('$baseUrl/api/Conference/GetAll/153'),
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return GetAllConferenceModel.fromJson(data);
      } else {
        LoaderX.hide();
        SnackbarUtils.showErrorSnackbar("Server Error",
            "Error while Conferance, Please try after some time.");
        return Future.error("Server Error");
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Failed to Conferance", e.toString());
      throw e.toString();
    }
  }

  getByIdEvent(String id) async {
    try {
      var response = await http
          .get(Uri.parse('$baseUrl/api/User/VerifyEmail?token=$id'), headers: {
        'Content-type': 'application/json',
      });
      if (response.statusCode == 200) {
        var decodedUser = jsonDecode(response.body);
        return decodedUser;
      } else {
        LoaderX.hide();
        SnackbarUtils.showErrorSnackbar("Server Error",
            "Error while user verifyEmail, Please try after some time.");
        return Future.error("Server Error");
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Failed to Signup", e.toString());
      throw e.toString();
    }
  }
}
