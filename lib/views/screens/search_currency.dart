import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../api_helpers_class/api2_helper.dart';
import '../../api_helpers_class/api_helpers.dart';
import '../../controllers/theme_controller.dart';
import '../../model_class/api2_model.dart';
import '../../model_class/api_model.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController seachCOntroller = TextEditingController();

  late Future<List<CurrencyAll>?> future;

  @override
  void initState() {
    super.initState();

    future = ApiHelperAll.apiHelperall.fetchDataAll();
  }

  ThemeController themeController = Get.put(ThemeController());

  Color baseColor = Color(0xFFF2F2F2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? Color(0xFF292D32) : baseColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? Color(0xFF292D32) : baseColor,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new,color: Get.isDarkMode ? Colors.white : Colors.black,)),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15,bottom: 20,top: 15),
              child:  Container(
                // height: 100,
                // width: double.infinity,
                margin: EdgeInsets.only(top: 4,bottom: 10),
                alignment:Alignment.center,
                child: Center(
                  child: TextField(
                    // showCursor: true,
                    // readOnly: true,
                    controller: seachCOntroller,
                    // keyboardType: TextInputType.number,
                    onSubmitted: (val) {
                      setState(() {
                        future = ApiHelperAll.apiHelperall.fetchDataAll(pacl: val.contains(val).toString());
                      });
                    },
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(20),
                      hintText: "Search Currency...",
                      prefixIcon: Icon(
                        Icons.search,
                        color: Get.isDarkMode ? Colors.white  : Colors.black,
                        size: 30,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.1),
                      offset: Offset(-6.0, -6.0),
                      blurRadius: 16.0,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      offset: Offset(6.0, 6.0),
                      blurRadius: 16.0,
                    ),
                  ],
                  color: Color(0xFF292D32),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.only(right: 0, bottom: 0, top: 8),
            //       child: Container(
            //         height: 50,
            //         alignment: Alignment.center,
            //         child: AnimSearchBar(
            //             width: 300,
            //             textController: seachCOntroller,
            //             textFieldColor: Colors.deepPurple[100],
            //             searchIconColor: Colors.deepPurple[500],
            //             onSuffixTap: () {
            //               setState(() {
            //                 seachCOntroller.clear();
            //               });
            //             },
            //             onSubmitted: (String data) {
            //               setState(() {
            //                 future = ApiHelperAll.apiHelperall.fetchDataAll();
            //               });
            //             }),
            //       ),
            //     ),
            //   ],
            // ),
          ),
          Expanded(
            flex: 12,
            child: FutureBuilder(
              future: future,
              builder: (context, snapShot) {
                if (snapShot.hasError) {
                  return Center(
                    child: Text(
                      "${snapShot.error}",
                    ),
                  );
                } else if (snapShot.hasData) {
                  List<CurrencyAll>? data = snapShot.data;

                  return (data != null)
                      ? ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 1, right: 10, bottom: 1),
                                    child: Container(
                                      height: 50,
                                      // width: 200,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        color: Colors.grey.shade50,
                                        shape: BoxShape.rectangle,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.shade300,
                                              spreadRadius: 0.0,
                                              blurRadius: 10,
                                              offset: Offset(3.0, 3.0)),
                                          BoxShadow(
                                              color: Colors.grey.shade400,
                                              spreadRadius: 0.0,
                                              blurRadius: 10 / 2.0,
                                              offset: Offset(3.0, 3.0)),
                                          BoxShadow(
                                              color: Colors.white,
                                              spreadRadius: 2.0,
                                              blurRadius: 10,
                                              offset: Offset(-3.0, -3.0)),
                                          BoxShadow(
                                              color: Colors.white,
                                              spreadRadius: 2.0,
                                              blurRadius: 10 / 2,
                                              offset: Offset(-3.0, -3.0)),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Row(
                                          children: [
                                            Text(
                                              "${data[i].code}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 20),
                                            ),
                                            Spacer(),
                                            Text(
                                              "${data[i].value}",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          })
                      : Center(
                          child: Text("No data found..."),
                        );
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
