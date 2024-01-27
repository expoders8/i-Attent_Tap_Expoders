import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/attechment_model.dart';
import '../../config/constant/constant.dart';
import '../../config/provider/loader_provider.dart';
import '../../config/provider/snackbar_provider.dart';

class AttechmentsService {
  Future<GetAllAttechmentModel> getAllAttechment(eventId) async {
    try {
      var response = await http.get(
        Uri.parse('$baseUrl/api/Event/GetEventAttachmentList/$eventId'),
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return GetAllAttechmentModel.fromJson(data);
      } else {
        LoaderX.hide();
        return Future.error("Server Error");
      }
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar("Failed to Attechments", e.toString());
      throw e.toString();
    }
  }
}
