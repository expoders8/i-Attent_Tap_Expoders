import 'package:get/get.dart';

import '../models/attechment_model.dart';
import '../services/attechment_service.dart';

class GetAllAttechmentController extends GetxController {
  var isLoading = true.obs;
  RxString eventId = "".obs;
  var attechmentList = <GetAllAttechmentModel>[].obs;
  AttechmentsService attechmentsService = AttechmentsService();

  void eventIdString(String newValue) {
    eventId.value = newValue;
    fetchAllAttechments();
  }

  @override
  void onInit() {
    fetchAllAttechments();
    super.onInit();
  }

  void fetchAllAttechments() async {
    try {
      isLoading(true);
      var stories =
          await attechmentsService.getAllAttechment(eventId.toString());
      attechmentList.assign(stories);
    } finally {
      isLoading(false);
    }
  }
}
