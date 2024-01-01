import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../config/constant/color_constant.dart';

class QrCodePage extends StatefulWidget {
  const QrCodePage({super.key});

  @override
  State<QrCodePage> createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackGroundColor,
        leadingWidth: 60,
        title: const Text("QR Code"),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: kDividerColor,
            height: 1.0,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          QrImageView(
            data: 'Jones Brams',
            version: QrVersions.auto,
            size: 200.0,
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Use your QR Code to:"),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 2, 10),
                  child: Text(
                      "- Check in to yout event if yout event is using i-Attent-TAP's check-in sevice"),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 2, 10),
                  child: Text(
                      "- Give exhibitors and vendors your contact info(if your event has exhibitors)"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
