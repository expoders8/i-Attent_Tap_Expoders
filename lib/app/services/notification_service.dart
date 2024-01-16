import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../config/constant/constant.dart';
import '../../config/provider/loader_provider.dart';
import '../../config/provider/snackbar_provider.dart';

class NotificationService {
  addReminder(String minutes, String agendaId, String userId) async {
    try {
      var response =
          await http.post(Uri.parse('$baseUrl/api/Notification/AddReminder'),
              body: json.encode({
                "minutes": minutes,
                "agendaId": agendaId,
                "userId": userId,
              }),
              headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200) {
        var decodedUser = jsonDecode(response.body);
        LoaderX.hide();
        return decodedUser;
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
