import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/conference_model.dart';
import '../../config/constant/constant.dart';
import '../../config/provider/loader_provider.dart';
import '../../config/provider/snackbar_provider.dart';

class ConferenceService {
  Future<GetAllConferenceModel> getAllConferance() async {
    var data = getStorage.read('user');
    var getUserData = jsonDecode(data);
    try {
      var response = await http.get(
        Uri.parse(
            '$baseUrl/api/Conference/GetAll/${getUserData['id'].toString()}'),
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
}
