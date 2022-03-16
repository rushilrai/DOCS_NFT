import 'package:docs/models/user.dart';
import 'package:docs/pages/signup_address.dart';
import 'package:docs/pages/signup_docinfo.dart';
import 'package:docs/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SignUpBasicPage extends StatefulWidget {
  @override
  _SignUpBasicPageState createState() => _SignUpBasicPageState();
}

class _SignUpBasicPageState extends State<SignUpBasicPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  bool maleSelected;
  bool femaleSelected;
  bool othersSelected;
  bool doctorSelected;
  bool patientSelected;

  @override
  void initState() {
    maleSelected = false;
    femaleSelected = false;
    othersSelected = false;
    doctorSelected = false;
    patientSelected = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: bgColor,
      ),
      child: Scaffold(
        backgroundColor: lightPurple,
        body: SafeArea(
          child: Container(
            color: lightPurple,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 30.0,
                        right: 30.0,
                        top: 10,
                        bottom: 10,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FadeIn(
                                0.5,
                                Material(
                                  borderRadius: BorderRadius.circular(13),
                                  color: lightPurple,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(13),
                                    splashColor: darkPurple,
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                      height: Get.width * 0.12,
                                      width: Get.width * 0.12,
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
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
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          ListView(
                            shrinkWrap: true,
                            children: [
                              FadeIn(
                                0.8,
                                Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
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
                                            TextSelectionThemeData(
                                          selectionColor: Color.fromRGBO(
                                              98, 112, 221, 0.34),
                                          selectionHandleColor: Color.fromRGBO(
                                              98, 112, 221, 0.34),
                                        ),
                                      ),
                                      child: TextField(
                                        controller: nameController,
                                        cursorColor: lightPurple,
                                        cursorRadius: Radius.circular(30),
                                        cursorWidth: 3,
                                        decoration: InputDecoration(
                                            disabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            hintText: 'Name',
                                            hintStyle: TextStyle(
                                              color: Color.fromRGBO(
                                                  98, 112, 221, 0.34),
                                              fontSize: 20,
                                            )),
                                        strutStyle: StrutStyle(
                                          fontFamily: 'Poppins',
                                        ),
                                        style: TextStyle(
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
                              SizedBox(
                                height: 12,
                              ),
                              FadeIn(
                                1.1,
                                Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
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
                                            TextSelectionThemeData(
                                          selectionColor: Color.fromRGBO(
                                              98, 112, 221, 0.34),
                                          selectionHandleColor: Color.fromRGBO(
                                              98, 112, 221, 0.34),
                                        ),
                                      ),
                                      child: TextField(
                                        controller: emailController,
                                        cursorColor: lightPurple,
                                        cursorRadius: Radius.circular(30),
                                        cursorWidth: 3,
                                        decoration: InputDecoration(
                                            disabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            hintText: 'E-Mail',
                                            hintStyle: TextStyle(
                                              color: Color.fromRGBO(
                                                  98, 112, 221, 0.34),
                                              fontSize: 20,
                                            )),
                                        strutStyle: StrutStyle(
                                          fontFamily: 'Poppins',
                                        ),
                                        style: TextStyle(
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
                              SizedBox(
                                height: 12,
                              ),
                              FadeIn(
                                1.4,
                                Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
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
                                            TextSelectionThemeData(
                                          selectionColor: Color.fromRGBO(
                                              98, 112, 221, 0.34),
                                          selectionHandleColor: Color.fromRGBO(
                                              98, 112, 221, 0.34),
                                        ),
                                      ),
                                      child: TextField(
                                        keyboardType: TextInputType.phone,
                                        maxLength: 10,
                                        controller: mobileController,
                                        cursorColor: lightPurple,
                                        cursorRadius: Radius.circular(30),
                                        cursorWidth: 3,
                                        decoration: InputDecoration(
                                            counterText: '',
                                            disabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            hintText: 'Mobile Number',
                                            hintStyle: TextStyle(
                                              color: Color.fromRGBO(
                                                  98, 112, 221, 0.34),
                                              fontSize: 20,
                                            )),
                                        strutStyle: StrutStyle(
                                          fontFamily: 'Poppins',
                                        ),
                                        style: TextStyle(
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
                              SizedBox(
                                height: 12,
                              ),
                              FadeIn(
                                1.7,
                                GestureDetector(
                                  onTap: () {
                                    Get.bottomSheet(
                                      BottomSheet(
                                        elevation: 1,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                        ),
                                        onClosing: () {},
                                        builder: (context) {
                                          return Container(
                                            height: Get.width * 0.8,
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
                                                        BorderRadius.circular(
                                                            13),
                                                    color: lightPurple,
                                                    child: InkWell(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              13),
                                                      splashColor: darkPurple,
                                                      onTap: () {
                                                        Get.back();
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(13),
                                                        ),
                                                        height:
                                                            Get.width * 0.12,
                                                        width: Get.width * 0.12,
                                                        child: Center(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .arrow_back,
                                                                color: Colors
                                                                    .white,
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Material(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13),
                                                    color: (maleSelected)
                                                        ? lightPurple
                                                        : Colors.white,
                                                    child: InkWell(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              13),
                                                      splashColor: darkPurple,
                                                      onTap: () {
                                                        setState(() {
                                                          maleSelected = true;
                                                          femaleSelected =
                                                              false;
                                                          othersSelected =
                                                              false;
                                                          Get.back();
                                                        });
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(13),
                                                        ),
                                                        height:
                                                            Get.width * 0.14,
                                                        child: Center(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                'Male',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize: 24,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: (maleSelected)
                                                                      ? Colors
                                                                          .white
                                                                      : lightPurple,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Material(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13),
                                                    color: (femaleSelected)
                                                        ? lightPurple
                                                        : Colors.white,
                                                    child: InkWell(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              13),
                                                      splashColor: darkPurple,
                                                      onTap: () {
                                                        setState(() {
                                                          maleSelected = false;
                                                          femaleSelected = true;
                                                          othersSelected =
                                                              false;
                                                          Get.back();
                                                        });
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(13),
                                                        ),
                                                        height:
                                                            Get.width * 0.14,
                                                        child: Center(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                'Female',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize: 24,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: (femaleSelected)
                                                                      ? Colors
                                                                          .white
                                                                      : lightPurple,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Material(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13),
                                                    color: (othersSelected)
                                                        ? lightPurple
                                                        : Colors.white,
                                                    child: InkWell(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              13),
                                                      splashColor: darkPurple,
                                                      onTap: () {
                                                        setState(() {
                                                          maleSelected = false;
                                                          femaleSelected =
                                                              false;
                                                          othersSelected = true;
                                                          Get.back();
                                                        });
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(13),
                                                        ),
                                                        height:
                                                            Get.width * 0.14,
                                                        child: Center(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                'Others',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize: 24,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: (othersSelected)
                                                                      ? Colors
                                                                          .white
                                                                      : lightPurple,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            decoration: BoxDecoration(),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
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
                                              TextSelectionThemeData(
                                            selectionColor: Color.fromRGBO(
                                                98, 112, 221, 0.34),
                                            selectionHandleColor:
                                                Color.fromRGBO(
                                                    98, 112, 221, 0.34),
                                          ),
                                        ),
                                        child: TextField(
                                          enabled: false,
                                          cursorColor: lightPurple,
                                          cursorRadius: Radius.circular(30),
                                          cursorWidth: 3,
                                          decoration: InputDecoration(
                                              suffixIcon: Icon(
                                                Icons.arrow_drop_down,
                                                color: Color.fromRGBO(
                                                    98, 112, 221, 0.34),
                                              ),
                                              disabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              hintText: (maleSelected)
                                                  ? 'Male'
                                                  : (femaleSelected)
                                                      ? 'Female'
                                                      : (othersSelected)
                                                          ? 'Others'
                                                          : 'Gender',
                                              hintStyle: TextStyle(
                                                color: (maleSelected)
                                                    ? lightPurple
                                                    : (femaleSelected)
                                                        ? lightPurple
                                                        : (othersSelected)
                                                            ? lightPurple
                                                            : Color.fromRGBO(98,
                                                                112, 221, 0.34),
                                                fontSize: 20,
                                              )),
                                          strutStyle: StrutStyle(
                                            fontFamily: 'Poppins',
                                          ),
                                          style: TextStyle(
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
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              FadeIn(
                                2.0,
                                GestureDetector(
                                  onTap: () {
                                    Get.bottomSheet(
                                      BottomSheet(
                                        elevation: 1,
                                        shape: RoundedRectangleBorder(
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
                                                        BorderRadius.circular(
                                                            13),
                                                    color: lightPurple,
                                                    child: InkWell(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              13),
                                                      splashColor: darkPurple,
                                                      onTap: () {
                                                        Get.back();
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(13),
                                                        ),
                                                        height:
                                                            Get.width * 0.12,
                                                        width: Get.width * 0.12,
                                                        child: Center(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .arrow_back,
                                                                color: Colors
                                                                    .white,
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Material(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13),
                                                    color: (doctorSelected)
                                                        ? lightPurple
                                                        : Colors.white,
                                                    child: InkWell(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              13),
                                                      splashColor: darkPurple,
                                                      onTap: () {
                                                        setState(() {
                                                          doctorSelected = true;
                                                          patientSelected =
                                                              false;
                                                          Get.back();
                                                        });
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(13),
                                                        ),
                                                        height:
                                                            Get.width * 0.14,
                                                        child: Center(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                'Doctor',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize: 24,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: (doctorSelected)
                                                                      ? Colors
                                                                          .white
                                                                      : lightPurple,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Material(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13),
                                                    color: (patientSelected)
                                                        ? lightPurple
                                                        : Colors.white,
                                                    child: InkWell(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              13),
                                                      splashColor: darkPurple,
                                                      onTap: () {
                                                        setState(() {
                                                          doctorSelected =
                                                              false;
                                                          patientSelected =
                                                              true;
                                                          Get.back();
                                                        });
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(13),
                                                        ),
                                                        height:
                                                            Get.width * 0.14,
                                                        child: Center(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                'Patient',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize: 24,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: (patientSelected)
                                                                      ? Colors
                                                                          .white
                                                                      : lightPurple,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            decoration: BoxDecoration(),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
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
                                              TextSelectionThemeData(
                                            selectionColor: Color.fromRGBO(
                                                98, 112, 221, 0.34),
                                            selectionHandleColor:
                                                Color.fromRGBO(
                                                    98, 112, 221, 0.34),
                                          ),
                                        ),
                                        child: TextField(
                                          enabled: false,
                                          cursorColor: lightPurple,
                                          cursorRadius: Radius.circular(30),
                                          cursorWidth: 3,
                                          decoration: InputDecoration(
                                            suffixIcon: Icon(
                                              Icons.arrow_drop_down,
                                              color: Color.fromRGBO(
                                                  98, 112, 221, 0.34),
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
                                                      : Color.fromRGBO(
                                                          98, 112, 221, 0.34),
                                              fontSize: 20,
                                            ),
                                          ),
                                          strutStyle: StrutStyle(
                                            fontFamily: 'Poppins',
                                          ),
                                          style: TextStyle(
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
                              ),
                              SizedBox(
                                height: 12,
                              ),
                            ],
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          FadeIn(
                            2.3,
                            Material(
                              borderRadius: BorderRadius.circular(13),
                              color: lightPurple,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(13),
                                splashColor: darkPurple,
                                onTap: () {
                                  if (nameController.text.length > 0 &&
                                      emailController.text.length > 0 &&
                                      (maleSelected == true ||
                                          femaleSelected == true ||
                                          othersSelected == true) &&
                                      mobileController.text.length == 10 &&
                                      (patientSelected == true ||
                                          doctorSelected == true)) {
                                    if (patientSelected) {
                                      userName = nameController.text;
                                      userEmail = emailController.text;
                                      userGender = (maleSelected)
                                          ? 'Male'
                                          : (femaleSelected)
                                              ? 'Female'
                                              : 'Other';
                                      userMobile = mobileController.text;
                                      userRole = 'patient';
                                      Get.to(SignUpAddressPage());
                                    } else {
                                      userName = nameController.text;
                                      userEmail = emailController.text;
                                      userGender = (maleSelected)
                                          ? 'Male'
                                          : (femaleSelected)
                                              ? 'Female'
                                              : 'Other';
                                      userMobile = mobileController.text;
                                      userRole = 'doctor';
                                      Get.to(SignUpDocInfoPage());
                                    }
                                    print('valid');
                                  } else {
                                    Get.snackbar(
                                      'Error',
                                      "Fill all Details",
                                      barBlur: 0,
                                      snackPosition: SnackPosition.TOP,
                                      backgroundColor: bgColor,
                                      borderRadius: 10,
                                      titleText: Text(
                                        'Error',
                                        style: TextStyle(
                                          fontFamily: 'Trueno',
                                          fontWeight: FontWeight.w800,
                                          color: lightPurple,
                                        ),
                                      ),
                                      messageText: Text(
                                        'Fill all Details',
                                        style: TextStyle(
                                          fontFamily: 'Trueno',
                                          fontWeight: FontWeight.w400,
                                          color: lightPurple,
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                  height: Get.width * 0.14,
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Proceed',
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
                          ),
                          SizedBox(
                            height: 18,
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0, -5),
                          blurRadius: 10,
                          spreadRadius: -9,
                        )
                      ],
                      color: bgColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                      ),
                    ),
                    width: Get.width,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
