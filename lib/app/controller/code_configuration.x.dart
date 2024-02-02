// ignore_for_file: public_member_api_docs

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:confrance_expoders/config/provider/loader_provider.dart';

import '../../config/utils/preference_utils.dart';
import '../../config/provider/snackbar_provider.dart';

class CodeConfigurationX extends GetxController {
  final servicesUrlController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    servicesUrlController.text = PreferenceUtils.getBaseUrl() ?? '';
  }

  void resetConfigCode() => servicesUrlController.text = "";

  Future<void> submit() async {
    try {
      final servicesUrl = servicesUrlController.text;
      String? baseUrl;
      if (servicesUrl.isNotEmpty) {
        if (!servicesUrl.isURL) {
          SnackbarUtils.showErrorSnackbar("Invalid URL", "");
          return;
        }
        baseUrl = servicesUrl;
      }
      await PreferenceUtils.setBaseUrl(baseUrl);
      LoaderX.hide();
      servicesUrlController.clear();
      SnackbarUtils.showSnackbar(
          baseUrl != null
              ? "i-Attend TAP Web Server URL configured!"
              : "i-Attend TAP Web Server URL cleared!",
          "");
    } catch (e) {
      LoaderX.hide();
      SnackbarUtils.showErrorSnackbar(e.toString(), "");
    } finally {
      LoaderX.hide();
    }
  }
}
