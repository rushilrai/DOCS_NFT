// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:docsapp/pages/home.dart';
import 'package:docsapp/pages/signup_basic.dart';
import 'package:docsapp/pages/verify_prescription.dart';
import 'package:docsapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late bool pswdConditions;
  late bool pswdError;
  late bool doctorSelected;
  late bool patientSelected;
  late String role;

  @override
  void initState() {
    pswdConditions = false;
    pswdError = true;
    doctorSelected = false;
    patientSelected = false;
    role = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: bgColor,
      ),
      child: Scaffold(
        backgroundColor: lightPurple,
        body: SafeArea(
          top: false,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/bgLogin.png'),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Material(
                                type: MaterialType.transparency,
                                child: Hero(
                                  tag: 'docs',
                                  child: Text(
                                    'Docs.',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 54,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                ' Saving lives remotely.',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 30.0,
                      right: 30.0,
                      top: 10,
                      bottom: 10,
                    ),
                    child: Column(
                      children: [
                        const Spacer(
                          flex: 1,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.bottomSheet(
                              BottomSheet(
                                elevation: 1,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                onClosing: () {},
                                builder: (context) {
                                  return Container(
                                    height: Get.width * 0.7,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 30.0,
                                        right: 30.0,
                                        top: 20,
                                        bottom: 10,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Material(
                                            borderRadius:
                                                BorderRadius.circular(13),
                                            color: lightPurple,
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(13),
                                              splashColor: darkPurple,
                                              onTap: () {
                                                Get.back();
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(13),
                                                ),
                                                height: Get.width * 0.12,
                                                width: Get.width * 0.12,
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: const [
                                                      Icon(
                                                        Icons.arrow_back,
                                                        color: Colors.white,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Material(
                                            borderRadius:
                                                BorderRadius.circular(13),
                                            color: (doctorSelected)
                                                ? lightPurple
                                                : Colors.white,
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(13),
                                              splashColor: darkPurple,
                                              onTap: () {
                                                setState(() {
                                                  doctorSelected = true;
                                                  patientSelected = false;
                                                  role = 'doctor';
                                                  Get.back();
                                                });
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(13),
                                                ),
                                                height: Get.width * 0.14,
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Doctor',
                                                        style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              (doctorSelected)
                                                                  ? Colors.white
                                                                  : lightPurple,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Material(
                                            borderRadius:
                                                BorderRadius.circular(13),
                                            color: (patientSelected)
                                                ? lightPurple
                                                : Colors.white,
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(13),
                                              splashColor: darkPurple,
                                              onTap: () {
                                                setState(() {
                                                  doctorSelected = false;
                                                  patientSelected = true;
                                                  role = 'patient';
                                                  Get.back();
                                                });
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(13),
                                                ),
                                                height: Get.width * 0.14,
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Patient',
                                                        style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              (patientSelected)
                                                                  ? Colors.white
                                                                  : lightPurple,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                    decoration: const BoxDecoration(),
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  blurRadius: 10,
                                  spreadRadius: -10,
                                )
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(13),
                            ),
                            height: Get.width * 0.14,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 15.0,
                                right: 15.0,
                                top: 2,
                              ),
                              child: Theme(
                                data: ThemeData(
                                  textSelectionTheme:
                                      const TextSelectionThemeData(
                                    selectionColor:
                                        Color.fromRGBO(98, 112, 221, 0.34),
                                    selectionHandleColor:
                                        Color.fromRGBO(98, 112, 221, 0.34),
                                  ),
                                ),
                                child: TextField(
                                  enabled: false,
                                  cursorColor: lightPurple,
                                  cursorRadius: const Radius.circular(30),
                                  cursorWidth: 3,
                                  decoration: InputDecoration(
                                    suffixIcon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Color.fromRGBO(98, 112, 221, 0.34),
                                    ),
                                    disabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    hintText: (doctorSelected)
                                        ? 'Doctor'
                                        : (patientSelected)
                                            ? 'Patient'
                                            : 'User Type',
                                    hintStyle: TextStyle(
                                      color: (doctorSelected)
                                          ? lightPurple
                                          : (patientSelected)
                                              ? lightPurple
                                              : const Color.fromRGBO(
                                                  98, 112, 221, 0.34),
                                      fontSize: 20,
                                    ),
                                  ),
                                  strutStyle: const StrutStyle(
                                    fontFamily: 'Poppins',
                                  ),
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: lightPurple,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                                blurRadius: 10,
                                spreadRadius: -10,
                              )
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13),
                          ),
                          height: Get.width * 0.14,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                              right: 15.0,
                              top: 2,
                            ),
                            child: Theme(
                              data: ThemeData(
                                textSelectionTheme:
                                    const TextSelectionThemeData(
                                  selectionColor:
                                      Color.fromRGBO(98, 112, 221, 0.34),
                                  selectionHandleColor:
                                      Color.fromRGBO(98, 112, 221, 0.34),
                                ),
                              ),
                              child: TextField(
                                keyboardType: TextInputType.visiblePassword,
                                controller: emailController,
                                cursorColor: lightPurple,
                                cursorRadius: const Radius.circular(30),
                                cursorWidth: 3,
                                decoration: const InputDecoration(
                                    disabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    hintText: 'Enter E-Mail',
                                    hintStyle: TextStyle(
                                      color: Color.fromRGBO(98, 112, 221, 0.34),
                                      fontSize: 20,
                                    )),
                                strutStyle: const StrutStyle(
                                  fontFamily: 'Poppins',
                                ),
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: lightPurple,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                                blurRadius: 10,
                                spreadRadius: -10,
                              )
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13),
                          ),
                          height: Get.width * 0.14,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                              right: 15.0,
                              top: 2,
                            ),
                            child: Theme(
                              data: ThemeData(
                                textSelectionTheme:
                                    const TextSelectionThemeData(
                                  selectionColor:
                                      Color.fromRGBO(98, 112, 221, 0.34),
                                  selectionHandleColor:
                                      Color.fromRGBO(98, 112, 221, 0.34),
                                ),
                              ),
                              child: TextField(
                                controller: passwordController,
                                onChanged: (text) {
                                  if (6 > text.length) {
                                    setState(() {
                                      pswdError = true;
                                      pswdConditions = false;
                                    });
                                  }
                                  if (text.length >= 6) {
                                    setState(() {
                                      pswdError = false;
                                      pswdConditions = true;
                                    });
                                  }
                                },
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                cursorColor: lightPurple,
                                cursorRadius: const Radius.circular(30),
                                cursorWidth: 3,
                                decoration: const InputDecoration(
                                  disabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                    color: Color.fromRGBO(98, 112, 221, 0.34),
                                    fontSize: 20,
                                  ),
                                ),
                                strutStyle: const StrutStyle(
                                  fontFamily: 'Poppins',
                                ),
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: lightPurple,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(13),
                          color: lightPurple,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(13),
                            splashColor: darkPurple,
                            onTap: () {
                              _login(
                                role,
                                emailController.text,
                                passwordController.text,
                                context,
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                              ),
                              height: Get.width * 0.14,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Login',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'New User ? ',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(98, 112, 221, 0.34),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(const SignUpBasicPage());
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: lightPurple,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(const VerifyPrescriptionPage());
                              },
                              child: const Text(
                                'Verify Prescription',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: lightPurple,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0, -5),
                          blurRadius: 30,
                          spreadRadius: -9,
                        )
                      ],
                      color: bgColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                      )),
                  height: Get.width * 0.9,
                  width: Get.width,
                ),
              ],
            ),
            color: lightPurple,
          ),
        ),
      ),
    );
  }
}

void showLoadingDialogue(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text('Please Wait'),
          content: Text('Loading...'),
        );
      });
}

void _login(
    String role, String email, String password, BuildContext context) async {
  showLoadingDialogue(context);
  final http.Response loginResponse = await http.post(
    Uri.parse('http://10.0.2.2:8080/user/login/$role'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, String>{"_id": email, "password": password},
    ),
  );
  if (loginResponse.statusCode == 200) {
    String loginResponseJson = loginResponse.body;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id;
    var name;
    var mobile;
    var address;

    id = jsonDecode(loginResponseJson)['user']['_id'];
    name = jsonDecode(loginResponseJson)['user']['name'];
    mobile = jsonDecode(loginResponseJson)['user']['contact_no'];
    address = jsonDecode(loginResponseJson)['user']['address'];

    prefs.setString('role', role);
    prefs.setString('userid', id);
    prefs.setString('password', password);
    prefs.setString('name', name);
    prefs.setString('mobile', mobile);
    prefs.setString('address', address);

    //doctor

    if (role == 'Doctor') {
      var spez;
      var qual;
      var slotStart;
      var slotStartObj;
      var slotEnd;
      var slotEndObj;

      spez = jsonDecode(loginResponseJson)['user']['specialization'];
      qual = jsonDecode(loginResponseJson)['user']['qualification'];
      slotStart = jsonDecode(loginResponseJson)['user']['slot_start'];
      // ignore: await_only_futures
      slotStartObj = await DateTime.parse(slotStart).hour;
      slotEnd = jsonDecode(loginResponseJson)['user']['slot_end'];
      // ignore: await_only_futures
      slotEndObj = await DateTime.parse(slotEnd).hour;

      prefs.setString('spez', spez);
      prefs.setString('qual', qual);
      if (slotStartObj < 10) {
        prefs.setString('slotStart', '0' + slotStartObj);
      } else {
        prefs.setString('slotStart', slotStartObj);
      }
      if (slotEndObj < 10) {
        prefs.setString('slotEnd', '0' + slotEndObj);
      } else {
        prefs.setString('slotEnd', slotEndObj);
      }
    }

    prefs.setBool('loggedin', true);

    Get.offAll(HomePage(name, role));
  } else {
    Get.back();
    Get.snackbar(
      'Failed',
      "Incorrect Details",
      barBlur: 0,
      snackPosition: SnackPosition.TOP,
      backgroundColor: bgColor,
      borderRadius: 10,
      titleText: const Text(
        'Failed',
        style: TextStyle(
          fontFamily: 'Trueno',
          fontWeight: FontWeight.w800,
          color: lightPurple,
        ),
      ),
      messageText: const Text(
        'Incorrect Details',
        style: TextStyle(
          fontFamily: 'Trueno',
          fontWeight: FontWeight.w400,
          color: lightPurple,
        ),
      ),
    );
  }
}
