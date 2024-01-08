import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

class LoaderX {
  static show(BuildContext context, width, height) {
    return Loader.show(context,
        progressIndicator: SpinnerX(
          spinnerHeight: height,
          spinnerWidth: width,
        ),
        overlayColor: Colors.white30);
  }

  static hide() {
    return Loader.hide();
  }
}

class SpinnerX extends StatelessWidget {
  final double spinnerWidth;
  final double spinnerHeight;
  const SpinnerX(
      {Key? key, required this.spinnerWidth, required this.spinnerHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        Future.value(false);
      },
      child: Center(
        child: Lottie.asset('assets/circle_loader.json',
            height: spinnerHeight, width: spinnerWidth),
      ),
    );
  }
}
