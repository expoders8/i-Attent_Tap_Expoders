import 'package:get/get.dart';

import '../models/notification_model.dart';
import '../services/notification_service.dart';

class GetAllNotificationController extends GetxController {
  var isLoading = true.obs;
  var notificationList = <GetAllNotificationModel>[].obs;
  NotificationService notificationService = NotificationService();

  @override
  void onInit() {
    fetchAllNotification();
    super.onInit();
  }

  void fetchAllNotification() async {
    try {
      isLoading(true);
      var stories = await notificationService.getAllNotification();
      notificationList.assign(stories);
    } finally {
      isLoading(false);
    }
  }
}
