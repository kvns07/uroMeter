import 'package:flutter/material.dart';
import 'package:urometer/Graph.dart';
import 'package:urometer/login.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'nameSearch.dart';
// import 'name_details_page.dart';  // Import the new page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final channelGLB = WebSocketChannel.connect(
    Uri.parse("ws://192.168.35.244:8080"),
  );
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Name Search',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Graph(),
    );
  }
}

