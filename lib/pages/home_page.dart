import 'package:flutter/material.dart';
import 'package:tech/local_storage/shared_pref.dart';
import 'package:tech/pages/login_page.dart';
import 'package:tech/responsiv_layout/responsiv_class.dart';
import 'package:tech/utils/global_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    debugPrint(GlobalData.profilPic);
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
              leading: Image.network(GlobalData.profilPic),
              title: Text(GlobalData.name),
              subtitle: Text(GlobalData.email),
              trailing: InkWell(
                  onTap: () async {
                    await SharedPref.stringSave(key: "name", value: "");
                    GlobalData.name = await SharedPref.stringGet(key: "name");
                    await SharedPref.stringSave(key: "email", value: "");
                    GlobalData.email = await SharedPref.stringGet(key: "email");
                    await SharedPref.stringSave(key: "profilePic", value: "");

                    GlobalData.profilPic =
                        await SharedPref.stringGet(key: "profilePic");

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Image.asset(
                    "assets/images/logout.png",
                    height: SizeConfig.heightMultiplier * 5,
                  ))),
        ],
      )),
    );
  }
}
