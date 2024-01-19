import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import '../../../config/constant/color_constant.dart';

class PdfViewWidget extends StatefulWidget {
  final String attechmentUrls;
  final String attechmentDescription;
  const PdfViewWidget({
    super.key,
    required this.attechmentUrls,
    required this.attechmentDescription,
  });

  @override
  State<PdfViewWidget> createState() => _PdfViewWidgetState();
}

class _PdfViewWidgetState extends State<PdfViewWidget> {
  int? pages = 1;
  int? currentPage = 1;
  int? totalPage = 1;
  String pdfFlePath = "https://www.africau.edu/images/default/sample.pdf";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 4,
                  offset: const Offset(1, 2),
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 100,
            child: Stack(
              fit: StackFit.passthrough,
              alignment: Alignment.center,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: PDFView(
                      filePath: pdfFlePath,
                      enableSwipe: true,
                      swipeHorizontal: true,
                      autoSpacing: false,
                      pageFling: false,
                      onRender: (_pages) {
                        setState(() {
                          pages = _pages;
                        });
                      },
                      onError: (error) {
                        print(error.toString());
                      },
                      onPageError: (page, error) {
                        print('$page: ${error.toString()}');
                      },
                      onPageChanged: (int? page, int? total) {
                        setState(() {
                          currentPage = page! + 1;
                          totalPage = total;
                        });
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(color: Colors.black38),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(8),
                        )),
                    child: const Text(
                      'Pro',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: totalPage! >= 2
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              children: [
                Text(
                  "Page: $currentPage/$totalPage",
                  style: const TextStyle(color: kGreyColor),
                ),
                totalPage! >= 2
                    ? const Text(
                        "Slide for next",
                        style: TextStyle(color: kGreyColor),
                      )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
