import 'package:get/get.dart';

import '../models/conference_model.dart';
import '../services/conference_service.dart';

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
