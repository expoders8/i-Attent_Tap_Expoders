// ignore_for_file: public_member_api_docs
import 'package:get/get.dart';

class SignInScreenX extends GetxController {
  final organizationId = ''.obs;
  var username = ''.obs;
  final password = ''.obs;

  final isSigningIn = false.obs;

  // Future<void> signIn() async {
  //   isSigningIn(true);
  //   try {
  //     final signInResponseModel = await AuthProvider.X.signIn(
  //       organizationId.value,
  //       username.value,
  //       password.value,
  //       "fcmToken",
  //     );

  //     if (signInResponseModel.isError ?? false) {
  //       throw signInResponseModel.errorMessage ?? 'Something went wrong';
  //     }

  //     signInResponseModel.username = username.value;
  //     signInResponseModel.organizationId = organizationId.value;

  //     await AppService.X.signIn(signInResponseModel);
  //   } catch (e) {
  //     NotificationUtils.showErrorSnackBar(message: e.toString());
  //   } finally {
  //     isSigningIn(false);
  //   }
  // }
}
