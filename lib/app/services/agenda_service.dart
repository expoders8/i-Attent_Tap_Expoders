import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../config/constant/constant.dart';
import '../../config/provider/loader_provider.dart';
import '../../config/provider/snackbar_provider.dart';

class AgendaService {
  getAllAgenda(String token) async {
    try {
      var response = await http.get(
          Uri.parse('$baseUrl/api/User/VerifyEmail?token=$token'),
          headers: {
            'Content-type': 'application/json',
            // 'Ocp-Apim-Subscription-Key': ocpApimSubscriptionKey
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

  getByIdAgenda(String id) async {
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
