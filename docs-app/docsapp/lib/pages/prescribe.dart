// ignore_for_file: prefer_typing_uninitialized_variables, no_logic_in_create_state

import 'dart:convert';

import 'package:docsapp/models/prescriptions.dart';
import 'package:docsapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class PrescribePage extends StatefulWidget {
  String userid;
  String patientName;
  PrescribePage(this.userid, this.patientName, {Key? key}) : super(key: key);
  @override
  _PrescribePageState createState() => _PrescribePageState(userid, patientName);
}

class _PrescribePageState extends State<PrescribePage> {
  String userid;
  String patientName;
  _PrescribePageState(this.userid, this.patientName);

  var prescription;
  List<Meds> medsList = [];

  late String docId;
  late String password;

  void startPrescription() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    docId = prefs.getString('userid')!;
    password = prefs.getString('password')!;
    medsList = [];
    prescription = Prescriptions('nd', userid, docId, medsList);
  }

  TextEditingController medName = TextEditingController();
  TextEditingController medQuant = TextEditingController();
  TextEditingController medComment = TextEditingController();

  @override
  void initState() {
    startPrescription();
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
                        //physics: BouncingScrollPhysics(),
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
                            height: 20,
                          ),
                          Row(
                            children: const [
                              Text(
                                'Prescription for:',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(76, 76, 81, 0.8),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                patientName,
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  color: lightPurple,
                                ),
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
                                        height: Get.width * 1.0,
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
                                              Container(
                                                decoration: BoxDecoration(
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 0.25),
                                                      blurRadius: 10,
                                                      spreadRadius: -10,
                                                    )
                                                  ],
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(13),
                                                ),
                                                height: Get.width * 0.14,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 15.0,
                                                    right: 15.0,
                                                    top: 2,
                                                  ),
                                                  child: Theme(
                                                    data: ThemeData(
                                                      textSelectionTheme:
                                                          const TextSelectionThemeData(
                                                        selectionColor:
                                                            Color.fromRGBO(98,
                                                                112, 221, 0.34),
                                                        selectionHandleColor:
                                                            Color.fromRGBO(98,
                                                                112, 221, 0.34),
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      controller: medName,
                                                      cursorColor: lightPurple,
                                                      cursorRadius:
                                                          const Radius.circular(
                                                              30),
                                                      cursorWidth: 3,
                                                      decoration:
                                                          const InputDecoration(
                                                              disabledBorder:
                                                                  InputBorder
                                                                      .none,
                                                              focusedBorder:
                                                                  InputBorder
                                                                      .none,
                                                              enabledBorder:
                                                                  InputBorder
                                                                      .none,
                                                              hintText:
                                                                  'Medicine Name',
                                                              hintStyle:
                                                                  TextStyle(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        98,
                                                                        112,
                                                                        221,
                                                                        0.34),
                                                                fontSize: 20,
                                                              )),
                                                      strutStyle:
                                                          const StrutStyle(
                                                        fontFamily: 'Poppins',
                                                      ),
                                                      style: const TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: lightPurple,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 0.25),
                                                      blurRadius: 10,
                                                      spreadRadius: -10,
                                                    )
                                                  ],
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(13),
                                                ),
                                                height: Get.width * 0.14,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 15.0,
                                                    right: 15.0,
                                                    top: 2,
                                                  ),
                                                  child: Theme(
                                                    data: ThemeData(
                                                      textSelectionTheme:
                                                          const TextSelectionThemeData(
                                                        selectionColor:
                                                            Color.fromRGBO(98,
                                                                112, 221, 0.34),
                                                        selectionHandleColor:
                                                            Color.fromRGBO(98,
                                                                112, 221, 0.34),
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      controller: medQuant,
                                                      cursorColor: lightPurple,
                                                      cursorRadius:
                                                          const Radius.circular(
                                                              30),
                                                      cursorWidth: 3,
                                                      decoration:
                                                          const InputDecoration(
                                                              disabledBorder:
                                                                  InputBorder
                                                                      .none,
                                                              focusedBorder:
                                                                  InputBorder
                                                                      .none,
                                                              enabledBorder:
                                                                  InputBorder
                                                                      .none,
                                                              hintText:
                                                                  'Qauntity',
                                                              hintStyle:
                                                                  TextStyle(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        98,
                                                                        112,
                                                                        221,
                                                                        0.34),
                                                                fontSize: 20,
                                                              )),
                                                      strutStyle:
                                                          const StrutStyle(
                                                        fontFamily: 'Poppins',
                                                      ),
                                                      style: const TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: lightPurple,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 0.25),
                                                      blurRadius: 10,
                                                      spreadRadius: -10,
                                                    )
                                                  ],
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(13),
                                                ),
                                                height: Get.width * 0.14,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 15.0,
                                                    right: 15.0,
                                                    top: 2,
                                                  ),
                                                  child: Theme(
                                                    data: ThemeData(
                                                      textSelectionTheme:
                                                          const TextSelectionThemeData(
                                                        selectionColor:
                                                            Color.fromRGBO(98,
                                                                112, 221, 0.34),
                                                        selectionHandleColor:
                                                            Color.fromRGBO(98,
                                                                112, 221, 0.34),
                                                      ),
                                                    ),
                                                    child: TextField(
                                                      controller: medComment,
                                                      cursorColor: lightPurple,
                                                      cursorRadius:
                                                          const Radius.circular(
                                                              30),
                                                      cursorWidth: 3,
                                                      decoration:
                                                          const InputDecoration(
                                                              disabledBorder:
                                                                  InputBorder
                                                                      .none,
                                                              focusedBorder:
                                                                  InputBorder
                                                                      .none,
                                                              enabledBorder:
                                                                  InputBorder
                                                                      .none,
                                                              hintText:
                                                                  'Comments',
                                                              hintStyle:
                                                                  TextStyle(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        98,
                                                                        112,
                                                                        221,
                                                                        0.34),
                                                                fontSize: 20,
                                                              )),
                                                      strutStyle:
                                                          const StrutStyle(
                                                        fontFamily: 'Poppins',
                                                      ),
                                                      style: const TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: lightPurple,
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
                                                color: lightPurple,
                                                child: InkWell(
                                                  borderRadius:
                                                      BorderRadius.circular(13),
                                                  splashColor: darkPurple,
                                                  onTap: () {
                                                    if (medName
                                                            .text.isNotEmpty &&
                                                        medQuant
                                                            .text.isNotEmpty &&
                                                        medComment
                                                            .text.isNotEmpty) {
                                                      var med = Meds.prescr(
                                                          medName.text,
                                                          medQuant.text,
                                                          medComment.text);
                                                      medsList.add(med);
                                                      medName.clear();
                                                      medQuant.clear();
                                                      medComment.clear();
                                                      Get.back();
                                                      setState(() {});
                                                    } else {
                                                      Get.snackbar(
                                                        'Error',
                                                        "Fill all Details",
                                                        barBlur: 0,
                                                        snackPosition:
                                                            SnackPosition.TOP,
                                                        backgroundColor:
                                                            bgColor,
                                                        borderRadius: 10,
                                                        titleText: const Text(
                                                          'Error',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Trueno',
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            color: lightPurple,
                                                          ),
                                                        ),
                                                        messageText: const Text(
                                                          'Fill all Details',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Trueno',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: lightPurple,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              13),
                                                    ),
                                                    height: Get.width * 0.14,
                                                    child: Center(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: const [
                                                          Text(
                                                            'Confirm',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 24,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        decoration: const BoxDecoration(),
                                      );
                                    },
                                  ),
                                  isScrollControlled: true,
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
                                        'Add Medicine',
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
                          const Spacer(
                            flex: 1,
                          ),
                          AspectRatio(
                            aspectRatio: Get.width / (Get.height / 2),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 8.0,
                                  left: 8.0,
                                  right: 8.0,
                                  bottom: 8.0,
                                ),
                                child: (medsList.isEmpty)
                                    ? const Center(
                                        child: Text(
                                          'Add Medicines to show here',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: Color.fromRGBO(
                                                98, 112, 221, 0.6),
                                          ),
                                        ),
                                      )
                                    : ListView.builder(
                                        physics: const BouncingScrollPhysics(),
                                        itemCount: medsList.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '• ' +
                                                          medsList[index].name,
                                                      style: const TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: darkPurple,
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        medsList
                                                            .removeAt(index);
                                                        setState(() {});
                                                      },
                                                      child: const Icon(
                                                        Icons
                                                            .remove_circle_outline_rounded,
                                                        color: lightPurple,
                                                        size: 24,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '   ' +
                                                          medsList[index]
                                                              .quantity,
                                                      style: const TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Color.fromRGBO(
                                                            98, 112, 221, 1),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '   ' +
                                                          medsList[index]
                                                              .comment,
                                                      style: const TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Color.fromRGBO(
                                                            76, 76, 81, 0.8),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Divider(
                                                  thickness: 1,
                                                  color: Color.fromRGBO(
                                                      98, 112, 221, 0.3),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                              ),
                              //height: Get.width * 0.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
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
                                newPrescription(
                                    context, userid, docId, medsList, password);
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
                                        'Submit Prescription',
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

void newPrescription(context, userid, docid, List<Meds> meds, password) async {
  showLoadingDialogue(context);
  // ignore: unused_local_variable
  http.Response prescNewResponse = await http.post(
    Uri.parse('https://bcic-docs-api.azurewebsites.net/prescription/new'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      {
        "prescription": {"user_id": userid, "doc_id": docid, "meds": meds},
        "userlogin": {"_id": docid, "password": password}
      },
    ),
  );
  await getPrescriptions();
  Get.back();
  Get.back();
  Get.snackbar(
    'Success',
    "Prescription Submitted",
    barBlur: 0,
    snackPosition: SnackPosition.TOP,
    backgroundColor: bgColor,
    borderRadius: 10,
    titleText: const Text(
      'Success',
      style: TextStyle(
        fontFamily: 'Trueno',
        fontWeight: FontWeight.w800,
        color: lightPurple,
      ),
    ),
    messageText: const Text(
      'Prescription Submitted',
      style: TextStyle(
        fontFamily: 'Trueno',
        fontWeight: FontWeight.w400,
        color: lightPurple,
      ),
    ),
  );
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
    },
  );
}
