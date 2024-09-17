import 'package:flutter/material.dart';
import 'Welcome_screen.dart';
import 'buttom_navigation_bar.dart';
import 'cloud_fairbae_screen.dart';
import 'beuity.dart';
import 'package:flutter/material.dart';
import 'package:pro1/Api_provider/api_provider.dart';
import 'package:dio/dio.dart';
import '../models/products_model.dart';
import 'dart:convert';
import 'package:pro1/models/products_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Welcome_screen.dart';
import 'loginScreen.dart';
import 'onboardingScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(),
      initialRoute: '/',
      routes: {
        '/': (context) => OnboardingScreen(),
        '/home': (context) => LoginScreen(),
      },
    );
  }
}
