// ignore_for_file: avoid_print, use_key_in_widget_constructors

import 'package:docsapp/models/appointments.dart';
import 'package:docsapp/pages/prescribe.dart';
import 'package:docsapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class AppointmentDetailsPage extends StatefulWidget {
  String patientid;
  String role;
  String id;
  String patientName;
  String docName;
  String timeStart;
  String timeEnd;
  String desc;
  bool approved;
  AppointmentDetailsPage(this.patientid, this.role, this.id, this.patientName,
      this.docName, this.timeStart, this.timeEnd, this.desc, this.approved);
  @override
  // ignore: no_logic_in_create_state
  _AppointmentDetailsPageState createState() => _AppointmentDetailsPageState(
      patientid,
      role,
      id,
      patientName,
      docName,
      timeStart,
      timeEnd,
      desc,
      approved);
}

class _AppointmentDetailsPageState extends State<AppointmentDetailsPage> {
  String patientid;
  String role;
  String id;
  String patientName;
  String docName;
  String timeStart;
  String timeEnd;
  String desc;
  bool approved;
  _AppointmentDetailsPageState(
      this.patientid,
      this.role,
      this.id,
      this.patientName,
      this.docName,
      this.timeStart,
      this.timeEnd,
      this.desc,
      this.approved);
  late bool video;
  // ignore: prefer_typing_uninitialized_variables
  var difference;
  late DateTime now;
  void checkVideo() {
    now = DateTime.now();
    difference = int.parse(DateTime.parse(timeEnd).hour.toString()) -
        int.parse(
          now.hour.toString(),
        );
    //print(DateTime.parse(timeEnd).hour);
    //print(difference);
    if (difference == 1) {
      video = true;
    } else {
      video = false;
    }
  }

  Map<FeatureFlagEnum, bool> featureFlags = {
    FeatureFlagEnum.INVITE_ENABLED: false,
    FeatureFlagEnum.MEETING_NAME_ENABLED: false,
    FeatureFlagEnum.RAISE_HAND_ENABLED: false,
    FeatureFlagEnum.LIVE_STREAMING_ENABLED: false,
    FeatureFlagEnum.MEETING_PASSWORD_ENABLED: false,
    FeatureFlagEnum.CALENDAR_ENABLED: false,
  };

  @override
  void initState() {
    getAppointments().then((value) => (value) ? setState2() : print('none'));
    checkVideo();
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
                                'Consulting Doctor:',
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
                                docName,
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  color: lightPurple,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Text(
                                'Concerned Patient:',
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
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: const [
                              Text(
                                'Time Slot Allotted:',
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
                                DateFormat('H:mm').format(
                                      DateTime.parse(timeStart),
                                    ) +
                                    ' - ' +
                                    DateFormat('H:mm').format(
                                      DateTime.parse(timeEnd),
                                    ),
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  color: lightPurple,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                DateFormat('LLL d, y').format(
                                  DateTime.parse(timeStart),
                                ),
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: lightPurple,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: const [
                              Text(
                                'Status:',
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
                                (approved)
                                    ? 'Approved'
                                    : 'Waiting for Approval',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  color: (approved)
                                      ? lightPurple
                                      : const Color.fromRGBO(98, 112, 221, 0.7),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Material(
                                borderRadius: BorderRadius.circular(8),
                                color: (video)
                                    ? lightPurple
                                    : const Color.fromRGBO(98, 112, 221, 0.7),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(8),
                                  splashColor: darkPurple,
                                  onTap: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    final role = prefs.getString('role');
                                    if (approved) {
                                      if (video) {
                                        try {
                                          var options = JitsiMeetingOptions(
                                              room:
                                                  id) // Required, spaces will be trimmed
                                            ..userDisplayName =
                                                (role == 'patient')
                                                    ? patientName
                                                    : docName
                                            ..subject = 'Consultation'
                                            ..audioOnly = true
                                            ..audioMuted = true
                                            ..featureFlags = featureFlags
                                            ..videoMuted = true;

                                          await JitsiMeet.joinMeeting(options);
                                        } catch (error) {
                                          debugPrint("error: $error");
                                        }
                                      } else {
                                        Get.snackbar(
                                          'Error',
                                          "Wait for your slot",
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
                                            'Wait for your slot',
                                            style: TextStyle(
                                              fontFamily: 'Trueno',
                                              fontWeight: FontWeight.w400,
                                              color: lightPurple,
                                            ),
                                          ),
                                        );
                                      }
                                    } else {
                                      Get.snackbar(
                                        'Error',
                                        "Your appointment is yet to be approved",
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
                                        messageText: Text(
                                          (role == 'patient')
                                              ? 'Your appointment is yet to be approved'
                                              : 'You have not approved this appointment',
                                          style: const TextStyle(
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
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    height: Get.width * 0.12,
                                    width: (role == 'patient')
                                        ? Get.width * 0.85
                                        : Get.width * 0.4,
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.video_call,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Consult',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              (role == 'doctor')
                                  ? Material(
                                      borderRadius: BorderRadius.circular(8),
                                      color: lightPurple,
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(8),
                                        splashColor: darkPurple,
                                        onTap: () async {
                                          Get.to(
                                            PrescribePage(
                                                patientid, patientName),
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          height: Get.width * 0.12,
                                          width: Get.width * 0.4,
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                Icon(
                                                  Icons.note_add_sharp,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Prescribe',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : const SizedBox(
                                      width: 0,
                                      height: 0,
                                    ),
                            ],
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
