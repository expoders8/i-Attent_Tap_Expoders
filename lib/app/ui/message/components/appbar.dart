import 'dart:io';
import 'package:flutter/material.dart';

import '../../../../config/constant/font_constant.dart';
import '../../../../config/constant/color_constant.dart';

typedef StringCallback = void Function(String val);

class MessageAppBar extends StatefulWidget {
  final StringCallback callbackSearchQuery;
  const MessageAppBar({
    Key? key,
    required this.callbackSearchQuery,
  }) : super(key: key);

  @override
  State<MessageAppBar> createState() => _MessageAppBarState();
}

class _MessageAppBarState extends State<MessageAppBar> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: Platform.isAndroid ? 110 : 110,
                color: kAppBarColor,
                // backgroundColor: kAppBarColor,
                child: Padding(
                  padding: EdgeInsets.only(top: Platform.isAndroid ? 5.0 : 5.0),
                  child: const Center(
                      child: Text(
                    "Messages",
                    style: TextStyle(
                      color: kBackGroundColor,
                      fontSize: 20,
                      fontFamily: kCircularStdMedium,
                    ),
                  )),
                ),
              ),
            ],
          ),
          Positioned(
            top: Platform.isAndroid ? 85 : 85,
            left: 15,
            right: 15,
            child: Container(
              height: 45,
              decoration: const BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(25, 158, 158, 158),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: PhysicalModel(
                color: kBlack38Color,
                borderRadius: BorderRadius.circular(8),
                elevation: 2.0,
                shadowColor: kBlack54Color,
                child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    errorMaxLines: 1,
                    hintText: "Search",
                    prefixIcon: Image.asset(
                      'assets/icons/discover_icon.png',
                      scale: 2.5,
                      color: kPrimaryColor,
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w400,
                      fontFamily: kCircularStdBook,
                    ),
                    suffixIcon: searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(
                              Icons.cancel_outlined,
                              size: 15,
                            ),
                            color: kPrimaryColor,
                            splashColor: kTransparentColor,
                            onPressed: () {
                              setState(() {});
                              searchController.clear();
                              widget.callbackSearchQuery(searchController.text);
                            },
                          )
                        : null,
                    filled: true,
                    fillColor: kWhiteColor,
                    errorStyle: const TextStyle(fontSize: 10),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      borderSide: BorderSide(color: kWhiteColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          const BorderSide(color: kWhiteColor, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: kWhiteColor,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {});
                    widget.callbackSearchQuery(searchController.text);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
