import 'dart:io';

import 'package:flutter/material.dart';

import '../message/components/appbar.dart';
import '../message/components/message_body.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  String searchQuery = "";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Platform.isAndroid
            ? 110
            : size.width > 500
                ? 120
                : 95),
        child: MessageAppBar(
          callbackSearchQuery: (val) {
            setState(() => searchQuery = val);
          },
        ),
      ),
      body: MessageBody(
        searchQueryText: searchQuery,
      ),
    );
  }
}
