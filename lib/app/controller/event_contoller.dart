import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/event_model.dart';
import '../services/event_service.dart';
import '../models/event_details_model.dart';
import '../../config/constant/constant.dart';
import '../../config/provider/snackbar_provider.dart';

class GetAllEventsController extends GetxController {
  var isLoading = true.obs;
  var eventList = <GetAllEventsModel>[].obs;
  EventService eventService = EventService();
  RxString selectedDate = "".obs;
  RxString conferanceId = "".obs;

  void selectedDateString(String newValue) {
    selectedDate.value = newValue;
  }

  void selectedIdString(String id) {
    conferanceId.value = id;
  }

  @override
  void onInit() {
    fetchAllEvents();
    super.onInit();
  }

  void fetchAllEvents() async {
    try {
      isLoading(true);
      var stories = await eventService.getAllEvent(
          selectedDate.toString(), conferanceId.toString());
      eventList.assign(stories);
    } finally {
      isLoading(false);
    }
  }
}

class GetDetailsEventController extends GetxController {
  var isLoading = true.obs;
  RxString eventId = "".obs;
  GetEventByIdModel? detailEventModel;

  void eventIdString(String newValue) {
    eventId.value = newValue;
    fetchEventDetail();
  }

  @override
  void onInit() {
    fetchEventDetail();
    super.onInit();
  }

  void fetchEventDetail() async {
    try {
      isLoading(true);
      var response = await http.get(
        Uri.parse("$baseUrl/api/Event/GetById/${eventId.toString()}"),
      );
      if (response.statusCode == 200) {
        detailEventModel =
            GetEventByIdModel.fromJson(jsonDecode(response.body));
      } else {
        return Future.error("Server Error");
      }
    } catch (error) {
      SnackbarUtils.showErrorSnackbar(
          error.toString(), "Error while Event, Please try after some time.");
      return Future.error(error);
    } finally {
      isLoading(false);
    }
  }
}
