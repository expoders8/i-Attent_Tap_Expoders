import 'package:confrance_expoders/config/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScanner extends StatefulWidget {
  const QrCodeScanner({super.key});

  @override
  State<QrCodeScanner> createState() => QrCodeScannerState();
}

class QrCodeScannerState extends State<QrCodeScanner> {
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
    // InteractiveViewer(
    //   panEnabled: false, // Set it to false to prevent panning.
    //   boundaryMargin: EdgeInsets.zero,
    //   minScale: 1,
    //   maxScale: 4,
    //   child: QRView(
    //     onQRViewCreated: onQRViewCreated,
    //     key: qrKey,
    //   ),
    // );
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
