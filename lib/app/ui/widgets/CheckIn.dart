// import 'package:barcode_scan/barcode_scan.dart';
import 'package:confrance_expoders/config/constant/color_constant.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../config/provider/snackbar_provider.dart';
import '../../../config/utils/DialogUtils.dart';
import '../../models/CheckInReqRes.dart';
import '../../models/HttpResponse.dart';
import '../../services/self_check_in_trycheckid.dart';

class CheckIn extends StatefulWidget {
  const CheckIn({super.key});

  @override
  State<CheckIn> createState() => _CheckInState();
}

class _CheckInState extends State<CheckIn> with SingleTickerProviderStateMixin {
  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();

  late CheckInReqRes req = CheckInReqRes();
  SelfCheckInTryCheckService selfCheckInTryCheckService =
      SelfCheckInTryCheckService();
  final _focusNodeOrgId = FocusNode();

  final _focusNodeEmail = FocusNode();

  final _focusNodePin = FocusNode();

  final _emailIdController = TextEditingController();

  final _orgIdController = TextEditingController();

  final _eventPinController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // _req.orgId = ref.read(prefsProvider).getOrgId();
    // _orgIdController.text = _req.orgId ?? '';
    // _req.email = ref.read(prefsProvider).getLastEmail();
    // _emailIdController.text = _req.email ?? '';
  }

  @override
  void dispose() {
    _focusNodeOrgId.dispose();
    _focusNodeEmail.dispose();
    _focusNodePin.dispose();

    _emailIdController.dispose();
    _orgIdController.dispose();
    _eventPinController.dispose();

    //_tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: const Text(
          'Self Check-In',
          style: TextStyle(color: kWhiteColor),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: kWhiteColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.camera,
              color: kWhiteColor,
            ),
            onPressed: () => scan(context),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  controller: _orgIdController,
                  decoration: const InputDecoration(
                    hintText: 'Organization ID',
                    labelText: 'Organization ID',
                  ),
                  validator: (val) =>
                      (val ?? '').isEmpty ? 'Provide Organization ID.' : null,
                  onSaved: (val) => req.orgId = val,
                  focusNode: _focusNodeOrgId,
                  onFieldSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(_focusNodeEmail),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _emailIdController,
                  decoration: const InputDecoration(
                    hintText: 'yourname@example.com',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Email Address',
                  ),
                  validator: (val) =>
                      (val ?? '').isEmpty ? 'Provide e-mail.' : null,
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (v) => req.email = v,
                  focusNode: _focusNodeEmail,
                  onFieldSubmitted: (_) {
                    _submitHandler(context);
                  },
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _eventPinController,
                  decoration: const InputDecoration(
                    hintText: 'Event Check-in Pin provided to you.',
                    labelText: 'Self Check-in Event PIN',
                  ),
                  validator: (val) => (val ?? '').isEmpty
                      ? 'Provide self check-in Event PIN.'
                      : null,
                  onSaved: (v) => req.pin = v,
                  focusNode: _focusNodePin,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_focusNodeEmail);
                  },
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        kButtonColor,
                      ),
                      foregroundColor: MaterialStateProperty.all(
                        Colors.white,
                      ),
                    ),
                    child: const Text(
                      'CHECK-IN',
                      style: TextStyle(letterSpacing: 1.2),
                    ),
                    onPressed: () {
                      _submitHandler(context);
                    },
                  ),
                ),
              ],
            ),
          ),
          Offstage(
            offstage: !_isLoading,
            child: Container(
              color: Colors.white.withOpacity(0.3),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _submitHandler(BuildContext context) async {
    var form = _formKey.currentState;
    if (form?.validate() ?? false) {
      form?.save();
      await tryCheckIn(context);
    }
  }

  tryCheckIn(BuildContext context, [bool checkOut = false]) async {
    setState(() {
      _isLoading = true;
    });

    req.checkOut = checkOut;

    // if (req.email != null) {
    //   // ref.read(prefsProvider).setLastEmail(_req.email!);
    // }

    // if (req.orgId != null) {
    //   // ref.read(prefsProvider).setOrgId(_req.orgId!);
    // }
    selfCheckInTryCheckService.tryCheckIn(req).then((ApiResponse res) {
      if (res.message == null) {
        CheckInReqRes data = res.data;
        if (data.canCheckOut ?? false) {
          // show popup with option to check out
          showSimpleAlert(context, "Already Checked-In",
              "You are already checked-in to '${data.eventName}'! \n\nDo you want to check out?",
              btnPositive: 'CHECK-OUT',
              btnPositiveCallback: () {
                Navigator.of(context).pop();
                tryCheckIn(context, true);
              },
              btnNegative: 'Cancel',
              btnNegativeCallback: () {
                Navigator.of(context).pop();
              });
          SnackbarUtils.showSnackbar("Already Checked-In",
              "You are already checked-in to '${data.eventName}'! \n\nDo you want to check out?");
          Navigator.of(context).pop();
        } else {
          if (data.checkOut ?? false) {
            // show popup with successful check-out
            showSimpleAlert(context, "Successfully Checked-Out",
                "You have been successfully checked-out of '${data.eventName}'! \n\nThank you for using i-Attend.",
                btnPositive: 'OK', btnPositiveCallback: () {
              // Navigator.of(context).popUntil(ModalRoute.withName(Home.route));
              Get.back();
            });
            Get.back();
          } else {
            // show popup with successful check-in
            showSimpleAlert(context, "Successfully Checked-In",
                "You have been successfully checked-in to '${data.eventName}'! \n\nThank you for using i-Attend.",
                btnPositiveCallback: () {
              // Navigator.of(context).popUntil(ModalRoute.withName(Home.route));
              Get.back();
            });
          }
        }
      } else {
        if (res.message!.contains('INVALID ORGID')) {
          showSimpleAlert(
            context,
            "Error",
            'Organization ID entered is invalid. Please enter a valid value.',
          );
        } else if (res.message!.contains('No ongoing event found')) {
          showSimpleAlert(
            context,
            "Error",
            'Event PIN entered is invalid. Please enter a valid value.',
          );
        } else if (res.message!.contains('Attendee not found')) {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (_) => AttendeeDetails(_req),
          //   ),
          // ).then(
          //   (_) {
          //     _req = CheckInReqRes();
          //   },
          // );
          Get.back();
        } else {
          showSimpleAlert(context, "Error", "${res.message}");
        }
      }

      setState(() {
        _isLoading = false;
      });
    });
    // ref.read(networkUtilProvider).tryCheckIn(req).then((ApiResponse res) {
    //   if (res.message == null) {
    //     CheckInReqRes data = res.data;
    //     if (data.canCheckOut ?? false) {
    //       // show popup with option to check out
    //       // dlg.showSimpleAlert(context, "Already Checked-In",
    //       //     "You are already checked-in to '${data.eventName}'! \n\nDo you want to check out?",
    //       //     btnPositive: 'CHECK-OUT',
    //       //     btnPositiveCallback: () {
    //       //       Navigator.of(context).pop();
    //       //       tryCheckIn(context, true);
    //       //     },
    //       //     btnNegative: 'Cancel',
    //       //     btnNegativeCallback: () {
    //       //       Navigator.of(context).pop();
    //       //     });
    //     } else {
    //       if (data.checkOut ?? false) {
    //         // show popup with successful check-out
    //         dlg.showSimpleAlert(context, "Successfully Checked-Out",
    //             "You have been successfully checked-out of '${data.eventName}'! \n\nThank you for using i-Attend.",
    //             btnPositive: 'OK', btnPositiveCallback: () {
    //           // Navigator.of(context).popUntil(ModalRoute.withName(Home.route));
    //           Get.back();
    //         });
    //       } else {
    //         // show popup with successful check-in
    //         dlg.showSimpleAlert(context, "Successfully Checked-In",
    //             "You have been successfully checked-in to '${data.eventName}'! \n\nThank you for using i-Attend.",
    //             btnPositiveCallback: () {
    //           // Navigator.of(context).popUntil(ModalRoute.withName(Home.route));
    //           Get.back();
    //         });
    //       }
    //     }
    //   } else {
    //     if (res.message!.contains('INVALID ORGID')) {
    //       dlg.showSimpleAlert(
    //         context,
    //         "Error",
    //         'Organization ID entered is invalid. Please enter a valid value.',
    //       );
    //     } else if (res.message!.contains('No ongoing event found')) {
    //       dlg.showSimpleAlert(
    //         context,
    //         "Error",
    //         'Event PIN entered is invalid. Please enter a valid value.',
    //       );
    //     } else if (res.message!.contains('Attendee not found')) {
    //       // Navigator.push(
    //       //   context,
    //       //   MaterialPageRoute(
    //       //     builder: (_) => AttendeeDetails(_req),
    //       //   ),
    //       // ).then(
    //       //   (_) {
    //       //     _req = CheckInReqRes();
    //       //   },
    //       // );
    //       Get.back();
    //     } else {
    //       dlg.showSimpleAlert(context, "Error", "${res.message}");
    //     }
    //   }

    //   setState(() {
    //     _isLoading = false;
    //   });
    // });
  }

  Future scan(BuildContext context) async {
    try {
      FocusScope.of(context).requestFocus(FocusNode());
      final barcode = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const _QrCodeScanner(),
            ),
          ) as String? ??
          '';
      // String barcode = (await BarcodeScanner.scan()).rawContent;
      //dlg.showSimpleAlert(context, "BARCODE", "$barcode");
      if (!mounted) return;

      if (barcode.isNotEmpty) {
        setState(() {
          var dataArr = barcode.split('||');
          req.orgId = dataArr[0];
          req.pin = dataArr[1];
          FocusScope.of(context).requestFocus(_focusNodeEmail);
        });
      } else {
        Navigator.pop(context);
      }
      //setState(() => this._eventPinController.text = barcode);
    } catch (_) {
//      if (e.code == BarcodeScanner.CameraAccessDenied) {
//        setState(() {
//          this.barcode = 'The user did not grant the camera permission!';
//        });
//      } else {
//        setState(() => this.barcode = 'Unknown error: $e');
//      }
//    } on FormatException{
//      setState(() => this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
//    } catch (e) {
//      setState(() => this.barcode = 'Unknown error: $e');
//    }
      Navigator.pop(context);
    }
  }
}

class _QrCodeScanner extends StatefulWidget {
  const _QrCodeScanner();

  @override
  State<_QrCodeScanner> createState() => __QrCodeScannerState();
}

class __QrCodeScannerState extends State<_QrCodeScanner> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  bool isLineVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        automaticallyImplyLeading: false,
        title: const Text(
          "Position the QR Code within the box to scan.",
          style: TextStyle(fontSize: 15, color: kWhiteColor),
        ),
      ),
      body: Stack(
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: onQRViewCreated,
          ),
          Center(
            child: Lottie.asset(
              'assets/scan2.json',
              width: 330,
              height: 330,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    controller.scannedDataStream.listen(
      (scanData) {
        controller.dispose();
        Navigator.pop(context, scanData.code);
      },
    );
  }
}
