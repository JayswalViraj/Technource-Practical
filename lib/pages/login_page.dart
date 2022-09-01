import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tech/api_services/api_services.dart';
import 'package:tech/local_storage/shared_pref.dart';
import 'package:tech/models/login_api_model.dart';
import 'package:tech/pages/home_page.dart';
import 'package:tech/pages/sign_up_page.dart';
import 'package:tech/responsiv_layout/responsiv_class.dart';
import 'package:tech/utils/colors.dart';
import 'package:tech/utils/global_data.dart';
import 'package:tech/validates/validates.dart';
import 'package:tech/widgets/custome_text.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool hidePassword = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: SizeConfig.screenHeight,
              color: primeryColor,
              child: Container(
                width: double.infinity,
                color: primeryColor,
                margin: EdgeInsets.only(
                    left: SizeConfig.widthMultiplier * 5,
                    right: SizeConfig.widthMultiplier * 5),
                child: Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 5,
                    ),
                    CustomeText(
                      text: "Welcome Back!",
                      fontSize: SizeConfig.heightMultiplier * 3,
                      color: white,
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 1.5,
                    ),
                    CustomeText(
                      text: "Please sign in to your account!",
                      fontSize: SizeConfig.heightMultiplier * 2,
                      color: hintColor,
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 8,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextFormField(
                          
                          validator: (value) {
                            return Validates.validateEmail(value!);
                          },
                          controller: username,
                          style: TextStyle(color: white),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              filled: true,
                              
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              hintText: "Email",
                              fillColor: textFieldBackgroundColor),
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 2,
                        ),
                        TextFormField(
                                 style: TextStyle(color: white),
                          obscureText: hidePassword,
                          validator: (value) {
                            return Validates.validatePassword(value.toString());
                          },
                          controller: password,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  icon: hidePassword
                                      ? Icon(
                                          Icons.visibility_off_outlined,
                                          color: hintColor,
                                        )
                                      : Icon(
                                          Icons.visibility,
                                          color: hintColor,
                                        ),
                                  onPressed: () {
                                    hidePassword = !hidePassword;
                                    setState(() {});
                                  }),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              hintText: "Password",
                              fillColor: textFieldBackgroundColor),
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 3,
                        ),
                        CustomeText(
                          text: "Forgot Password?",
                          fontSize: SizeConfig.heightMultiplier * 1.5,
                          color: hintColor,
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 10,
                        ),
                        InkWell(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              await ApiServices.callLoginApi()
                                  .then((value) async {
                                LoginApiModel? usersModel = value;

                                await SharedPref.stringSave(
                                    key: "name", value: usersModel!.data.name);
                                GlobalData.name =
                                    await SharedPref.stringGet(key: "name");
                                await SharedPref.stringSave(
                                    key: "email",
                                    value: usersModel.data.emailId);
                                GlobalData.email =
                                    await SharedPref.stringGet(key: "email");
                                await SharedPref.stringSave(
                                    key: "profilePic",
                                    value: usersModel.data.profilePic);

                                GlobalData.profilPic =
                                    await SharedPref.stringGet(
                                        key: "profilePic");
                                debugPrint("Name");
                                debugPrint(usersModel!.data.name);
                              });

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (cotext) => HomePage()));
                            }
                          },
                          child: Container(
                            //width: 100.0,
                            height: SizeConfig.heightMultiplier * 7.5,
                            decoration: BoxDecoration(
                              color: signInButtonColor,
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.heightMultiplier * 3),
                            ),
                            child: Center(
                              child: CustomeText(
                                text: "Sign in",
                                fontSize: SizeConfig.heightMultiplier * 2,
                                color: white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 2,
                        ),
                        InkWell(
                          onTap: () => print('hello'),
                          child: Container(
                            //width: 100.0,
                            height: SizeConfig.heightMultiplier * 7.5,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.heightMultiplier * 3),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/google.png",
                                    height: SizeConfig.heightMultiplier * 3,
                                  ),
                                  SizedBox(
                                    width: SizeConfig.widthMultiplier * 2,
                                  ),
                                  CustomeText(
                                    text: "Sign in with Google",
                                    fontSize: SizeConfig.heightMultiplier * 2,
                                    color: black,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomeText(
                          text: "Don't have an Account?",
                          fontSize: SizeConfig.heightMultiplier * 1.5,
                          color: white,
                        ),
                        SizedBox(
                          width: SizeConfig.widthMultiplier * 0.8,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()));
                          },
                          child: CustomeText(
                            text: "Sign Up",
                            fontSize: SizeConfig.heightMultiplier * 1.5,
                            color: signInButtonColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
