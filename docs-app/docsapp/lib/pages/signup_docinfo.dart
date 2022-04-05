// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:docsapp/models/user.dart';
import 'package:docsapp/pages/signup_address.dart';
import 'package:docsapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SignUpDocInfoPage extends StatefulWidget {
  const SignUpDocInfoPage({Key? key}) : super(key: key);

  @override
  _SignUpDocInfoPageState createState() => _SignUpDocInfoPageState();
}

class _SignUpDocInfoPageState extends State<SignUpDocInfoPage> {
  List<String> specializations = [
    'Allergy & Immunology',
    'Anesthesiology',
    'Dermatology',
    'Diagnostic Radiology',
    'Emergency Medicine',
    'Family Medicine',
    'Internal Medicine',
    'Medical Genetics',
    'Neurology',
    'Nuclear Medicine',
    'Obstetrics & Gynecology',
    'Opthalmology',
    'Pathology',
    'Pediatrics',
    'Physical Medicine',
    'Preventive Medicine',
    'Psychiatry',
    'Radiation Oncology',
    'Surgery',
    'Urology',
  ];
  var spezSelected;
  late bool spezSelection;
  List<String> periodsInit = ['09', '17', '01'];
  List<String> periodsFinal = ['17', '01', '09'];
  var initSelected;
  var finalSelected;
  late bool periodSelection;
  TextEditingController qualificationController = TextEditingController();
  TextEditingController localityController = TextEditingController();
  TextEditingController clinicController = TextEditingController();
  @override
  void initState() {
    spezSelected = '';
    spezSelection = false;
    initSelected = '';
    finalSelected = '';
    periodSelection = false;
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
                                  controller: qualificationController,
                                  cursorColor: lightPurple,
                                  cursorRadius: const Radius.circular(30),
                                  cursorWidth: 3,
                                  decoration: const InputDecoration(
                                      disabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      hintText: 'Qualifications',
                                      hintStyle: TextStyle(
                                        color:
                                            Color.fromRGBO(98, 112, 221, 0.34),
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
                                  controller: localityController,
                                  cursorColor: lightPurple,
                                  cursorRadius: const Radius.circular(30),
                                  cursorWidth: 3,
                                  decoration: const InputDecoration(
                                      disabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      hintText: 'Clinic Locality',
                                      hintStyle: TextStyle(
                                        color:
                                            Color.fromRGBO(98, 112, 221, 0.34),
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
                                  controller: clinicController,
                                  cursorColor: lightPurple,
                                  cursorRadius: const Radius.circular(30),
                                  cursorWidth: 3,
                                  decoration: const InputDecoration(
                                      disabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      hintText: 'Clinic/Hospital Name',
                                      hintStyle: TextStyle(
                                        color:
                                            Color.fromRGBO(98, 112, 221, 0.34),
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
                                      height: Get.width * 1.5,
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
                                                        BorderRadius.circular(
                                                            13),
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
                                            SizedBox(
                                              height: Get.width * 0.95,
                                              child: ListView.builder(
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount:
                                                    specializations.length,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10.0),
                                                    child: Material(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              13),
                                                      color: (spezSelected ==
                                                              specializations[
                                                                  index])
                                                          ? lightPurple
                                                          : Colors.white,
                                                      child: InkWell(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(13),
                                                        splashColor: darkPurple,
                                                        onTap: () {
                                                          setState(() {
                                                            spezSelection =
                                                                true;
                                                            spezSelected =
                                                                specializations[
                                                                    index];
                                                            Get.back();
                                                          });
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        13),
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
                                                                  specializations[
                                                                      index],
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        24,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: (spezSelected ==
                                                                            specializations[
                                                                                index])
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
                                                  );
                                                },
                                              ),
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
                                          color: Color.fromRGBO(
                                              98, 112, 221, 0.34),
                                        ),
                                        disabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        hintText: (spezSelection)
                                            ? spezSelected
                                            : 'Specialization',
                                        hintStyle: TextStyle(
                                          color: (spezSelection)
                                              ? lightPurple
                                              : const Color.fromRGBO(
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
                                                    BorderRadius.circular(13),
                                                splashColor: darkPurple,
                                                onTap: () {
                                                  Get.back();
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13),
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
                                            SizedBox(
                                              height: Get.width * 0.55,
                                              child: ListView.builder(
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: periodsInit.length,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10.0),
                                                    child: Material(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              13),
                                                      color: (initSelected ==
                                                              periodsInit[
                                                                  index])
                                                          ? lightPurple
                                                          : Colors.white,
                                                      child: InkWell(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(13),
                                                        splashColor: darkPurple,
                                                        onTap: () {
                                                          setState(() {
                                                            periodSelection =
                                                                true;
                                                            initSelected =
                                                                periodsInit[
                                                                    index];
                                                            finalSelected =
                                                                periodsFinal[
                                                                    index];
                                                            Get.back();
                                                          });
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        13),
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
                                                                  periodsInit[
                                                                          index] +
                                                                      ':00' +
                                                                      ' - ' +
                                                                      periodsFinal[
                                                                          index] +
                                                                      ':00',
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        24,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: (initSelected ==
                                                                            periodsInit[
                                                                                index])
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
                                                  );
                                                },
                                              ),
                                            )
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
                                          Icons.schedule_rounded,
                                          color: Color.fromRGBO(
                                              98, 112, 221, 0.34),
                                        ),
                                        disabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        hintText: (periodSelection)
                                            ? initSelected +
                                                ':00' +
                                                '-' +
                                                finalSelected +
                                                ':00'
                                            : 'Available Timings',
                                        hintStyle: TextStyle(
                                          color: (periodSelection)
                                              ? lightPurple
                                              : const Color.fromRGBO(
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
                          ),
                          const SizedBox(
                            height: 12,
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
                                if (spezSelection == true &&
                                    qualificationController.text.isNotEmpty &&
                                    periodSelection == true) {
                                  userSpecialization = spezSelected;
                                  userQualification =
                                      qualificationController.text;
                                  userPeriodInit = initSelected;
                                  userPeriodFinal = finalSelected;
                                  Get.to(const SignUpAddressPage());
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
