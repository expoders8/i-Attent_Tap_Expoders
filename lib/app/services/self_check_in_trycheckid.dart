import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/CheckInReqRes.dart';
import '../../config/provider/loader_provider.dart';
import '../../config/provider/snackbar_provider.dart';
import '../models/HttpResponse.dart';

class SelfCheckInTryCheckService {
  Future<ApiResponse> tryCheckIn(CheckInReqRes data) async {
    try {
      var response = await http.post(
          Uri.parse('http://selfcheck.i-attend.com/api/CheckIn/TryCheckIn'),
          body: json.encode(data),
          headers: {
            'Content-type': 'application/json',
            "Accept": "application/json"
          });
      if (response.statusCode == 200) {
        var decodedUser = jsonDecode(response.body);
        LoaderX.hide();
        return decodedUser;
      } else {
        LoaderX.hide();
        SnackbarUtils.showErrorSnackbar(
            "Server Error", "Error while CheckIn, Please try after some time.");
        return Future.error("Server Error");
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Failed to CheckIn", e.toString());
      throw e.toString();
    }
  }
}
