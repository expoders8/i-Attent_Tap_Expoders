import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../config/provider/snackbar_provider.dart';
import '../models/agenda_model.dart';
import '../services/agenda_service.dart';
import '../models/agenda_details_model.dart';
import '../../config/constant/constant.dart';

class GetAllAgendaController extends GetxController {
  var isLoading = true.obs;
  var agendaList = <GetAllAgendaModel>[].obs;
  AgendaService agendaService = AgendaService();
  RxString selectedDate = "".obs;

  void selectedDateString(String newValue) {
    selectedDate.value = newValue;
  }

  @override
  void onInit() {
    fetchAllAgenda();
    super.onInit();
  }

  void fetchAllAgenda() async {
    try {
      isLoading(true);
      var stories = await agendaService.getAllAgenda(selectedDate);
      agendaList.assign(stories);
    } finally {
      isLoading(false);
    }
  }
}

class GetDetailsAgendaController extends GetxController {
  var isLoading = true.obs;
  RxString agendaId = "".obs;
  GetAgendaByIdModel? detailAgendaModel;

  void agendaIdString(String newValue) {
    agendaId.value = newValue;
    fetchAgendaDetail();
  }

  @override
  void onInit() {
    fetchAgendaDetail();
    super.onInit();
  }

  fetchAgendaDetail() async {
    try {
      isLoading(true);
      var response = await http.get(
        Uri.parse("$baseUrl/api/Agenda/GetById/${agendaId.toString()}"),
      );
      if (response.statusCode == 200) {
        detailAgendaModel =
            GetAgendaByIdModel.fromJson(jsonDecode(response.body));
      } else {
        return Future.error("Server Error");
      }
    } catch (error) {
      SnackbarUtils.showErrorSnackbar(
          error.toString(), "Error while Agenda, Please try after some time.");
      return Future.error(error);
    } finally {
      isLoading(false);
    }
  }
}
