import 'package:flutter/material.dart';
import 'package:urometer/Graph.dart';
import 'package:urometer/login.dart';

import 'nameSearch.dart';
// import 'name_details_page.dart';  // Import the new page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Name Search',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

