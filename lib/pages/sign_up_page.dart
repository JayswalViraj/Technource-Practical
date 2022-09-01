import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tech/api_services/api_services.dart';
import 'package:tech/models/login_api_model.dart';
import 'package:tech/pages/login_page.dart';
import 'package:tech/responsiv_layout/responsiv_class.dart';
import 'package:tech/utils/colors.dart';
import 'package:tech/validates/validates.dart';
import 'package:tech/widgets/custome_text.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController username = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  final _formKey2 = GlobalKey<FormState>();

  bool hidePassword = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey2,
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
                      text: "Create new account",
                      fontSize: SizeConfig.heightMultiplier * 3,
                      color: white,
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 1.5,
                    ),
                    CustomeText(
                      text: "Please fill in the form to continue",
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
                                 style: TextStyle(color: white),
                          validator: (value) {
                            return Validates.validateFullName(value!);
                          },
                          controller: fullName,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              hintText: "Full Name",
                              fillColor: textFieldBackgroundColor),
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 2,
                        ),
                        TextFormField(
                                 style: TextStyle(color: white),
                          validator: (value) {
                            return Validates.validateEmail(value!);
                          },
                          controller: username,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              hintText: "Email Address",
                              fillColor: textFieldBackgroundColor),
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 2,
                        ),
                        TextFormField(
                                 style: TextStyle(color: white),
                          validator: (value) {
                            return Validates.validatePhoneNumber(value!);
                          },
                          keyboardType: TextInputType.phone,
                          controller: phoneNumber,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              hintText: "Phone Number",
                              fillColor: textFieldBackgroundColor),
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 2,
                        ),
                        TextFormField(
                                 style: TextStyle(color: white),
                          obscureText: hidePassword,
                          validator: (value) {
                            return Validates.validatePassword(value!);
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
                          height: SizeConfig.heightMultiplier * 10,
                        ),
                        InkWell(
                          onTap: () async {
                            if (_formKey2.currentState!.validate()) {
                              LoginApiModel? usersModel =
                                  await ApiServices.callLoginApi();
                              debugPrint("Name");
                              debugPrint(usersModel!.data.name);
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
                                text: "Sign Up",
                                fontSize: SizeConfig.heightMultiplier * 2,
                                color: white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomeText(
                          text: "Have an Account?",
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
                                    builder: (context) => LoginPage()));
                          },
                          child: CustomeText(
                            text: "Sign In",
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
