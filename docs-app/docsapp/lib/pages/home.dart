// ignore_for_file: no_logic_in_create_state, avoid_print

import 'package:docsapp/models/appointments.dart';
import 'package:docsapp/models/orders.dart';
import 'package:docsapp/models/prescriptions.dart';
import 'package:docsapp/pages/allappointments.dart';
import 'package:docsapp/pages/allorders.dart';
import 'package:docsapp/pages/allprescriptions.dart';
import 'package:docsapp/pages/appdetails.dart';
import 'package:docsapp/pages/find.dart';
import 'package:docsapp/pages/login.dart';
import 'package:docsapp/pages/requests.dart';
import 'package:docsapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  String name;
  String role;
  HomePage(this.name, this.role, {Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState(name, role);
}

class _HomePageState extends State<HomePage> {
  String name;
  String role;
  _HomePageState(this.name, this.role);
  @override
  void initState() {
    getAppointments().then((value) => (value) ? setState2() : print('same'));
    getPrescriptions();
    getOrders();
    super.initState();
  }

  void setState2() {
    setState(() {});
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                        const Color.fromRGBO(98, 112, 221, 1).withOpacity(0.3),
                        BlendMode.dstOut,
                      ),
                      alignment: Alignment.bottomCenter,
                      fit: BoxFit.cover,
                      image: const AssetImage('assets/images/bghome.png'),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Hello,',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(255, 255, 255, 0.65),
                              ),
                            ),
                            SizedBox(
                              width: Get.width - 60,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: Get.width * 0.7,
                                    child: Text(
                                      name,
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 36,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      logOut();
                                      // ignore: await_only_futures
                                      /*  await getAppointments();
                                        if (change) {
                                          setState(() {});
                                        }*/
                                    },
                                    icon: const Icon(
                                      Icons.logout,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(
                        flex: 1,
                      ),
                      const Text(
                        ' Upcoming Appointments',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(76, 76, 81, 0.8),
                        ),
                      ),
                      (role == 'patient')
                          ? const Spacer(
                              flex: 1,
                            )
                          : const SizedBox(
                              height: 15,
                            ),
                      Container(
                        child: (appointmentsList.isEmpty)
                            ? Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromRGBO(
                                          98, 112, 221, 0.2),
                                    ),
                                    height: Get.width * 0.4,
                                    child: const Text(
                                      "No Appointments",
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            Color.fromRGBO(98, 112, 221, 0.8),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          DateFormat('LLL d, y').format(
                                              DateTime.parse(appointmentsList
                                                  .last.timeStart)),
                                          style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromRGBO(
                                                98, 112, 221, 0.8),
                                          ),
                                        ),
                                        Text(
                                          DateFormat('H:mm').format(
                                              DateTime.parse(appointmentsList
                                                  .last.timeStart)),
                                          style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromRGBO(
                                                98, 112, 221, 0.8),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        (role == 'patient')
                                            ? Text(
                                                appointmentsList[
                                                        appointmentsList
                                                                .length -
                                                            1]
                                                    .docName,
                                                style: const TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.w600,
                                                  color: darkPurple,
                                                ),
                                              )
                                            : Text(
                                                appointmentsList[
                                                        appointmentsList
                                                                .length -
                                                            1]
                                                    .patientName,
                                                style: const TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.w600,
                                                  color: darkPurple,
                                                ),
                                              ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Material(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: lightPurple,
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            splashColor: darkPurple,
                                            onTap: () {
                                              Get.to(
                                                AppointmentDetailsPage(
                                                  appointmentsList.last.userId,
                                                  role,
                                                  appointmentsList.last.id,
                                                  appointmentsList
                                                      .last.patientName,
                                                  appointmentsList.last.docName,
                                                  appointmentsList
                                                      .last.timeStart,
                                                  appointmentsList.last.timeEnd,
                                                  appointmentsList.last.desc,
                                                  appointmentsList
                                                      .last.approved,
                                                ),
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              height: Get.width * 0.08,
                                              width: Get.width * 0.37,
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: const [
                                                    Icon(
                                                      Icons.info,
                                                      color: Colors.white,
                                                      size: 18,
                                                    ),
                                                    SizedBox(
                                                      width: 7,
                                                    ),
                                                    Text(
                                                      'Details',
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Material(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: lightPurple,
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            splashColor: darkPurple,
                                            onTap: () {
                                              Get.to(
                                                const AllApointmentsPage(),
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              height: Get.width * 0.08,
                                              width: Get.width * 0.37,
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: const [
                                                    Icon(
                                                      Icons.list_alt,
                                                      color: Colors.white,
                                                      size: 18,
                                                    ),
                                                    SizedBox(
                                                      width: 7,
                                                    ),
                                                    Text(
                                                      'View All',
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white,
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
                                  ],
                                ),
                              ),
                        height: Get.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                      ),
                      (role == 'patient' || role == 'Patient')
                          ? const Spacer(
                              flex: 3,
                            )
                          : Container(),
                      (role == 'patient' || role == 'Patient')
                          ? GestureDetector(
                              onTap: () {
                                Get.to(const FindPage());
                              },
                              child: Hero(
                                tag: 'searchBox',
                                child: Container(
                                  height: Get.width * 0.15,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 12.0,
                                      right: 12.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Material(
                                          type: MaterialType.transparency,
                                          child: Text(
                                            'Find Doctors',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromRGBO(
                                                  76, 76, 81, 0.8),
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.search_rounded,
                                          color:
                                              Color.fromRGBO(76, 76, 81, 0.8),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                      (role == 'patient' || role == 'Patient')
                          ? const Spacer(
                              flex: 3,
                            )
                          : const SizedBox(
                              height: 20,
                            ),
                      Container(
                        height: Get.width * 0.5,
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () async {
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  final role = prefs.getString('role');
                                  Get.to(
                                    AllPrescriptionPage(role!),
                                  );
                                },
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/pad.png',
                                        width: Get.width * 0.22,
                                      ),
                                      const Text(
                                        'Prescriptions',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Color.fromRGBO(98, 112, 221, 0.7),
                                        ),
                                      ),
                                    ],
                                  ),
                                  //height: Get.width * 0.4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  (role == 'doctor' || role == 'Doctor')
                                      ? Get.to(const RequestsPage())
                                      : Get.to(const AllOrdersPage());
                                },
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      (role == 'patient' || role == 'Patient')
                                          ? Image.asset(
                                              'assets/images/pill.png',
                                              width: Get.width * 0.22,
                                            )
                                          : Image.asset(
                                              'assets/images/request.png',
                                              width: Get.width * 0.22,
                                            ),
                                      (role == 'patient' || role == 'Patient')
                                          ? const Text(
                                              'Orders',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromRGBO(
                                                    98, 112, 221, 0.7),
                                              ),
                                            )
                                          : const Text(
                                              'Requests',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromRGBO(
                                                    98, 112, 221, 0.7),
                                              ),
                                            ),
                                    ],
                                  ),
                                  //height: Get.width * 0.4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: bgColor,
                        ),
                      ),
                      const Spacer(
                        flex: 2,
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
                height: Get.width * 1.4,
                width: Get.width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void logOut() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('loggedin', false);
  Get.offAll(const LoginPage());
}
