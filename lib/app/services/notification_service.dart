import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/notification_model.dart';
import '../../config/constant/constant.dart';
import '../../config/provider/loader_provider.dart';
import '../../config/provider/snackbar_provider.dart';

class NotificationService {
  addReminder(int minutes, int agendaId, String userId) async {
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
            "Error while Add Reminder, Please try after some time.");
        return Future.error("Server Error");
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Failed to Add Reminder", e.toString());
      throw e.toString();
    }
  }

  Future<GetAllNotificationModel> getAllNotification() async {
    var token = getStorage.read('authToken');
    try {
      var response = await http.get(
          Uri.parse('$baseUrl/api/Notification/GetNotifications'),
          headers: {"Authorization": "Bearer $token"});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return GetAllNotificationModel.fromJson(data);
      } else {
        LoaderX.hide();
        return Future.error("Server Error");
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Failed to Notification", e.toString());
      throw e.toString();
    }
  }
}
