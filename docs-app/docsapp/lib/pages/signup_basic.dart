import 'package:docsapp/models/user.dart';
import 'package:docsapp/pages/signup_address.dart';
import 'package:docsapp/pages/signup_docinfo.dart';
import 'package:docsapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SignUpBasicPage extends StatefulWidget {
  const SignUpBasicPage({Key? key}) : super(key: key);

  @override
  _SignUpBasicPageState createState() => _SignUpBasicPageState();
}

class _SignUpBasicPageState extends State<SignUpBasicPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  late bool maleSelected;
  late bool femaleSelected;
  late bool othersSelected;
  late bool doctorSelected;
  late bool patientSelected;

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
      value: const SystemUiOverlayStyle(
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
                const SizedBox(
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
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
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
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          ListView(
                            shrinkWrap: true,
                            children: [
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
                                      controller: nameController,
                                      cursorColor: lightPurple,
                                      cursorRadius: const Radius.circular(30),
                                      cursorWidth: 3,
                                      decoration: const InputDecoration(
                                          disabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          hintText: 'Name',
                                          hintStyle: TextStyle(
                                            color: Color.fromRGBO(
                                                98, 112, 221, 0.34),
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
                                      controller: emailController,
                                      cursorColor: lightPurple,
                                      cursorRadius: const Radius.circular(30),
                                      cursorWidth: 3,
                                      decoration: const InputDecoration(
                                          disabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          hintText: 'E-Mail',
                                          hintStyle: TextStyle(
                                            color: Color.fromRGBO(
                                                98, 112, 221, 0.34),
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
                                      keyboardType: TextInputType.phone,
                                      maxLength: 10,
                                      controller: mobileController,
                                      cursorColor: lightPurple,
                                      cursorRadius: const Radius.circular(30),
                                      cursorWidth: 3,
                                      decoration: const InputDecoration(
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
                                                      BorderRadius.circular(13),
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
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(13),
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
                                                              color:
                                                                  Colors.white,
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
                                                        femaleSelected = false;
                                                        othersSelected = false;
                                                        Get.back();
                                                      });
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(13),
                                                      ),
                                                      height: Get.width * 0.14,
                                                      child: Center(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'Male',
                                                              style: TextStyle(
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
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Material(
                                                  borderRadius:
                                                      BorderRadius.circular(13),
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
                                                        othersSelected = false;
                                                        Get.back();
                                                      });
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(13),
                                                      ),
                                                      height: Get.width * 0.14,
                                                      child: Center(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'Female',
                                                              style: TextStyle(
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
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Material(
                                                  borderRadius:
                                                      BorderRadius.circular(13),
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
                                                        femaleSelected = false;
                                                        othersSelected = true;
                                                        Get.back();
                                                      });
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(13),
                                                      ),
                                                      height: Get.width * 0.14,
                                                      child: Center(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'Others',
                                                              style: TextStyle(
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
                                          selectionColor: Color.fromRGBO(
                                              98, 112, 221, 0.34),
                                          selectionHandleColor: Color.fromRGBO(
                                              98, 112, 221, 0.34),
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
                                                          : const Color
                                                                  .fromRGBO(98,
                                                              112, 221, 0.34),
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
                              ),
                              const SizedBox(
                                height: 12,
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
                                                        BorderRadius.circular(
                                                            13),
                                                    splashColor: darkPurple,
                                                    onTap: () {
                                                      Get.back();
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(13),
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
                                                              color:
                                                                  Colors.white,
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
                                                        BorderRadius.circular(
                                                            13),
                                                    splashColor: darkPurple,
                                                    onTap: () {
                                                      setState(() {
                                                        doctorSelected = true;
                                                        patientSelected = false;
                                                        Get.back();
                                                      });
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(13),
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
                                                        BorderRadius.circular(
                                                            13),
                                                    splashColor: darkPurple,
                                                    onTap: () {
                                                      setState(() {
                                                        doctorSelected = false;
                                                        patientSelected = true;
                                                        Get.back();
                                                      });
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(13),
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
                                          selectionColor: Color.fromRGBO(
                                              98, 112, 221, 0.34),
                                          selectionHandleColor: Color.fromRGBO(
                                              98, 112, 221, 0.34),
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
                            ],
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
                                if (nameController.text.isNotEmpty &&
                                    emailController.text.isNotEmpty &&
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
                                    Get.to(const SignUpAddressPage());
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
                                    Get.to(const SignUpDocInfoPage());
                                  }
                                  // print('valid');
                                } else {
                                  Get.snackbar(
                                    'Error',
                                    "Fill all Details",
                                    barBlur: 0,
                                    snackPosition: SnackPosition.TOP,
                                    backgroundColor: bgColor,
                                    borderRadius: 10,
                                    titleText: const Text(
                                      'Error',
                                      style: TextStyle(
                                        fontFamily: 'Trueno',
                                        fontWeight: FontWeight.w800,
                                        color: lightPurple,
                                      ),
                                    ),
                                    messageText: const Text(
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
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
                          const SizedBox(
                            height: 18,
                          ),
                        ],
                      ),
                    ),
                    decoration: const BoxDecoration(
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
