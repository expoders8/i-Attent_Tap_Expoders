import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/event_model.dart';
import '../../config/constant/constant.dart';
import '../../config/provider/loader_provider.dart';
import '../../config/provider/snackbar_provider.dart';

class EventService {
  Future<GetAllEventsModel> getAllEvent(date, conferanceId) async {
    try {
      var response = await http.get(
        Uri.parse('$baseUrl/api/Event/GetEventList/$date/$conferanceId'),
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return GetAllEventsModel.fromJson(data);
      } else {
        LoaderX.hide();
        return Future.error("Server Error");
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Failed to Events", e.toString());
      throw e.toString();
    }
  }

  addAgenda(String title, String description, String location, String startDate,
      String endDate, eventId, String userId) async {
    var token = getStorage.read('authToken');
    try {
      var response = await http.post(Uri.parse('$baseUrl/api/Agenda/Add'),
          body: json.encode({
            "title": title,
            "description": description,
            "location": location,
            "startDate": startDate,
            "endDate": endDate,
            "eventId": eventId,
            "userId": userId
          }),
          headers: {
            'Content-type': 'application/json',
            "Authorization": "Bearer $token"
          });
      if (response.statusCode == 200) {
        var decodedUser = jsonDecode(response.body);
        return decodedUser;
      } else {
        LoaderX.hide();
        return Future.error("Server Error");
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Failed to add Agenda", e.toString());
      throw e.toString();
    }
  }
}
