// ignore_for_file: public_member_api_docs

import 'package:get/get.dart';

import '../services/auth_service.dart';

class SignInScreenX extends GetxController {
  AuthService authService = AuthService();
  final organizationId = ''.obs;
  var username = ''.obs;
  final password = ''.obs;

  final isSigningIn = false.obs;

  Future<void> login() async {
    isSigningIn(true);
    try {
      await authService.login(
          organizationId.value, username.value, password.value);
    } catch (e) {
    } finally {
      isSigningIn(false);
    }
  }
}
