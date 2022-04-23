import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:docsapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

class VerifyPrescriptionPage extends StatefulWidget {
  const VerifyPrescriptionPage({Key? key}) : super(key: key);

  @override
  State<VerifyPrescriptionPage> createState() => _VerifyPrescriptionPageState();
}

class _VerifyPrescriptionPageState extends State<VerifyPrescriptionPage> {
  late var resultValidity;
  late var hash;

  pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      File file = File(result.files.single.path.toString());
      var fileBytes = file.readAsBytesSync();
      hash = await sha256.convert(fileBytes);
      verify();
    } else {}
  }

  verify() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('http://10.0.2.2:8080/prescription/lookup'));
    request.body = json.encode({"fileHash": hash.toString()});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      setState(() {
        resultValidity = 'success';
      });
    } else {
      setState(() {
        resultValidity = 'failure';
      });
    }
  }

  @override
  void initState() {
    resultValidity = '';
    hash = '';
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
                        Material(
                          borderRadius: BorderRadius.circular(13),
                          color: lightPurple,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(13),
                            splashColor: darkPurple,
                            onTap: () {
                              pickFile();
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
                                      'Select File',
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
                          height: 150,
                        ),
                        (resultValidity == 'success')
                            ? Column(
                                children: [
                                  Icon(
                                    Icons.thumb_up_alt_rounded,
                                    size: 80,
                                    color: Colors.green,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Prescription is Valid',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green,
                                    ),
                                  )
                                ],
                              )
                            : (resultValidity == 'failure')
                                ? Column(
                                    children: [
                                      Icon(
                                        Icons.thumb_down_alt_rounded,
                                        size: 80,
                                        color: Colors.red,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Prescription is Invalid',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.red,
                                        ),
                                      )
                                    ],
                                  )
                                : Text(
                                    '',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green,
                                    ),
                                  )
                      ],
                    ),
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
