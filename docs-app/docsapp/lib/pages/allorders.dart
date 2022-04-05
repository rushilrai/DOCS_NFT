import 'package:docsapp/models/orders.dart';
import 'package:docsapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AllOrdersPage extends StatefulWidget {
  const AllOrdersPage({Key? key}) : super(key: key);

  @override
  _AllOrdersPageState createState() => _AllOrdersPageState();
}

class _AllOrdersPageState extends State<AllOrdersPage> {
  @override
  void initState() {
    updateOrders();
    super.initState();
  }

  void updateOrders() async {
    final refresh = await getOrders();
    if (refresh == 'refresh') {
      // print('ss');
      setState(() {});
    }
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
                                    Get.snackbar(
                                      'Refreshing',
                                      "Fetching all Orders",
                                      barBlur: 0,
                                      snackPosition: SnackPosition.TOP,
                                      backgroundColor: bgColor,
                                      borderRadius: 10,
                                      titleText: const Text(
                                        'Refreshing',
                                        style: TextStyle(
                                          fontFamily: 'Trueno',
                                          fontWeight: FontWeight.w800,
                                          color: lightPurple,
                                        ),
                                      ),
                                      messageText: const Text(
                                        'Fetching all Orders',
                                        style: TextStyle(
                                          fontFamily: 'Trueno',
                                          fontWeight: FontWeight.w400,
                                          color: lightPurple,
                                        ),
                                      ),
                                    );
                                    updateOrders();
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
                                            Icons.refresh,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
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
                          Expanded(
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: ordersList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    top: 12.0,
                                  ),
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 12.0,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount:
                                                ordersList[index].meds.length,
                                            itemBuilder: (context, i) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '• ' +
                                                          ordersList[index]
                                                              .meds[i]
                                                              .name
                                                              .toString(),
                                                      style: const TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: lightPurple,
                                                      ),
                                                    ),
                                                    Text(
                                                      '    ' +
                                                          ordersList[index]
                                                              .meds[i]
                                                              .comment
                                                              .toString(),
                                                      style: const TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Color.fromRGBO(
                                                            98, 112, 221, 0.7),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 14.0,
                                              right: 14.0,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Address:',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color.fromRGBO(
                                                        76, 76, 81, 0.8),
                                                  ),
                                                ),
                                                Text(
                                                  ordersList[index].address,
                                                  style: const TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color.fromRGBO(
                                                        98, 112, 221, 0.7),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 14.0,
                                              right: 14.0,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Contact Number:',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color.fromRGBO(
                                                        76, 76, 81, 0.8),
                                                  ),
                                                ),
                                                Text(
                                                  ordersList[index].contact,
                                                  style: const TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color.fromRGBO(
                                                        98, 112, 221, 0.7),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    //height: Get.width * 0.4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              },
                            ),
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
