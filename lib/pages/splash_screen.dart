import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tech/local_storage/shared_pref.dart';
import 'package:tech/pages/home_page.dart';
import 'package:tech/pages/login_page.dart';
import 'package:tech/utils/colors.dart';
import 'package:tech/utils/global_data.dart';
import 'package:tech/widgets/custome_text.dart';

import '../responsiv_layout/responsiv_class.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future getShardPrefData() async {
    GlobalData.name = await SharedPref.stringGet(key: "name") ?? "";
    debugPrint("Print Global name");
    debugPrint(GlobalData.name);
    GlobalData.profilPic = await SharedPref.stringGet(key: "profilePic") ?? "";
    debugPrint(GlobalData.profilPic);
    GlobalData.email = await SharedPref.stringGet(key: "email") ?? "";
    debugPrint(GlobalData.email);
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 10), () {
      getShardPrefData().then((value) {
        if (GlobalData.name == null || GlobalData.name == "") {
          return Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const LoginPage()));
        } else {
          return Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomePage()));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            child: Image.asset(
              "assets/images/splash.jpg",
              fit: BoxFit.fill,
            ),
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                  margin: EdgeInsets.only(top: SizeConfig.heightMultiplier * 8),
                  child: CustomeText(
                    text: "Welcome to Technource",
                    fontSize: SizeConfig.heightMultiplier * 3,
                    color: white,
                    fontWeight: FontWeight.bold,
                  ))),
        ],
      ),
    );
  }
}
