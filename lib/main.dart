import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api_project/API_TUTORIAL.dart';
import 'package:flutter_api_project/ApiFetchingData.dart';
import 'package:flutter_api_project/PhoneLoginApi.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Api_Tutorial());
  }
}


