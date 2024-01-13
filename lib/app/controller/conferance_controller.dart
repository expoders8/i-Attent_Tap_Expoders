import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../config/provider/snackbar_provider.dart';
import '../models/conference_model.dart';
import '../../config/constant/constant.dart';
import '../services/conference_service.dart';
import '../models/conference_details_model.dart';

class GetAllConferanceController extends GetxController {
  var isLoading = true.obs;
  var conferanceList = <GetAllConferenceModel>[].obs;
  ConferenceService conferenceService = ConferenceService();

  @override
  void onInit() {
    fetchAllConferace();
    super.onInit();
  }

  void fetchAllConferace() async {
    try {
      isLoading(true);
      var stories = await conferenceService.getAllConferance();
      conferanceList.assign(stories);
    } finally {
      isLoading(false);
    }
  }
}

class GetDetailsConferanceController extends GetxController {
  var isLoading = true.obs;
  RxString conferanceId = "".obs;
  GetConferanceByIdModel? detailModel;

  void conferanceIdString(String newValue) {
    conferanceId.value = newValue;
  }

  @override
  void onInit() {
    fetchStoryDetail();
    super.onInit();
  }

  void fetchStoryDetail() async {
    try {
      isLoading(true);
      var response = await http.get(
        Uri.parse("$baseUrl/api/Conference/GetById/${conferanceId.toString()}"),
      );
      if (response.statusCode == 200) {
        detailModel =
            GetConferanceByIdModel.fromJson(jsonDecode(response.body));
      } else {
        return Future.error("Server Error");
      }
    } catch (error) {
      SnackbarUtils.showErrorSnackbar(error.toString(),
          "Error while Conferance, Please try after some time.");
      return Future.error(error);
    } finally {
      isLoading(false);
    }
  }
}
