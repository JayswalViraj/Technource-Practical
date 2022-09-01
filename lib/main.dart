import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tech/pages/login_page.dart';
import 'package:tech/pages/splash_screen.dart';
import 'package:tech/responsiv_layout/responsiv_class.dart';


    class MyHttpoverrides extends HttpOverrides{
  @override 
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
    ..badCertificateCallback = (X509Certificate cert, String host, int port)=>true;
  }
}
void main() {
   HttpOverrides.global= MyHttpoverrides();
  
   SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);  
  runApp(LayoutBuilder(
    builder: (context,constraints) {
      return OrientationBuilder(
        builder: (context,orientation) {
           SizeConfig().init(constraints, orientation);
          return MaterialApp(home: SplashScreen(),);
        }
      );
    }
  ));
}


