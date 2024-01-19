import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
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
  String pdfFlePath = "";
  bool isLoading = false;
  late File pfile;

  downloadAndSavePdf() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.get(Uri.parse(widget.attechmentUrls));
    final bytes = response.bodyBytes;
    final dir = await getApplicationDocumentsDirectory();
    var file = File('${dir.path}/sample.pdf');
    await file.writeAsBytes(bytes, flush: true);
    setState(() {
      pfile = file;
    });
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    downloadAndSavePdf();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const SizedBox(
              height: 450,
              child: Center(
                  child: CircularProgressIndicator(
                color: kSelectedIconColor,
              )))
          : Column(
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
                            filePath: pfile.path,
                            enableSwipe: true,
                            swipeHorizontal: true,
                            autoSpacing: true,
                            pageFling: true,
                            onRender: (allPages) {
                              pages = allPages;
                            },
                            onError: (error) {},
                            onPageError: (page, error) {},
                            onPageChanged: (int? page, int? total) {
                              setState(() {
                                currentPage = page! + 1;
                                totalPage = total;
                              });
                            },
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
