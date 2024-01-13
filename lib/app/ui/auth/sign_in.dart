import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../auth/sing_in_footer.dart';
import '../widgets/custom_textfield.dart';
import '../../controller/sign_in_screen.x.dart';
import '../../../config/constant/color_constant.dart';
import '../../services/fcm_notification_service.dart';
import '../../../config/provider/loader_provider.dart';

class SignInScreen extends StatefulWidget {
  final int? selectedTabIndex;
  const SignInScreen({super.key, this.selectedTabIndex});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  final signInController = Get.put(SignInScreenX());
  String fcmToken = "";
  TextEditingController organizationController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FCMNotificationServices fCMNotificationServices = FCMNotificationServices();
  bool isFormSubmitted = false;

  @override
  void initState() {
    fCMNotificationServices.requestNotificationPermission();
    fCMNotificationServices.firebaseInit();
    fCMNotificationServices
        .getDeviceToken()
        .then((value) => {setState(() => fcmToken = value)});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack(
          children: [
            Image.asset(
              'assets/images/loginbg.png',
              fit: BoxFit.cover,
              width: size.width,
              height: size.height,
            ),
            SafeArea(
              child: Column(
                children: [
                  const Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 10,
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      padding:
                          const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Form(
                          key: _loginFormKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "i-Attend TAP",
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w900,
                                  color: kPrimaryColor,
                                ),
                              ),
                              const SizedBox(
                                height: 40.0,
                              ),
                              CustomTextFormField(
                                hintText: 'Enter Your Organization ID',
                                maxLines: 1,
                                ctrl: organizationController,
                                name: "organizationid",
                                prefixIcon: const Icon(
                                  Icons.group,
                                  color: kPrimaryColor,
                                  size: 22,
                                ),
                                formSubmitted: isFormSubmitted,
                                validationMsg: 'Organization ID is Required',
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              CustomTextFormField(
                                hintText: 'Enter Your Username',
                                maxLines: 1,
                                ctrl: userNameController,
                                name: "username",
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: kPrimaryColor,
                                  size: 22,
                                ),
                                formSubmitted: isFormSubmitted,
                                validationMsg: 'Username is Required',
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              CustomTextFormField(
                                hintText: 'Enter Your Password',
                                maxLines: 1,
                                ctrl: passwordController,
                                name: "password",
                                prefixIcon: const Icon(
                                  Icons.key,
                                  color: kPrimaryColor,
                                  size: 22,
                                ),
                                formSubmitted: isFormSubmitted,
                                validationMsg: 'Password is Required',
                              ),
                              const SizedBox(
                                height: 25.0,
                              ),
                              SizedBox(
                                width: size.width - 55,
                                height: 50,
                                child: CupertinoButton(
                                  borderRadius: BorderRadius.circular(25),
                                  color: const Color(0xFF4054FA),
                                  onPressed: onLoginButtonPress,
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                        color: kWhiteColor, fontSize: 16),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () => {},
                                child: const Text(
                                  'Configure App',
                                  style: TextStyle(color: kPrimaryColor),
                                ),
                              ),
                              const SizedBox(height: 40),
                              const SignInFooter()
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  onLoginButtonPress() {
    setState(() {
      isFormSubmitted = true;
    });
    FocusScope.of(context).requestFocus(FocusNode());
    Future.delayed(const Duration(milliseconds: 100), () async {
      if (_loginFormKey.currentState!.validate()) {
        signInController.organizationId(organizationController.text);
        signInController.email(userNameController.text);
        signInController.password(passwordController.text);
        signInController.fcmToken(fcmToken);
        LoaderX.show(context, 60.0, 60.0);

        signInController.login();
      }
    });
  }
}
