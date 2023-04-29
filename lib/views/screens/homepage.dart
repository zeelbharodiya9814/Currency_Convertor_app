import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:neumorphic_container/neumorphic_container.dart';
import 'package:pr_currency_app/api_helpers_class/api_helpers.dart';
import 'package:pr_currency_app/views/screens/search_currency.dart';
import '../../controllers/theme_controller.dart';
import '../../global_class/global.dart';
import '../../model_class/api_model.dart';
import '../../num_pad/numberpad.dart';
import 'package:clay_containers/clay_containers.dart';
import '';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Currency?> future;
  TextEditingController textEditingController = TextEditingController();


  TextEditingController dropController = TextEditingController();





  bool truedata = false;

  @override
  void initState() {
    super.initState();

    future = ApiHelper.apiHelper.fetchData(from: "USD", to: "INR", amount: 1);

    textEditingController.text = "1";
  }

  String fromCurrency = "USD";
  String toCurrency = "INR";

  ThemeController themeController = Get.put(ThemeController());

  Color baseColor = Color(0xFFF2F2F2);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar:
      // NeumorphicAppBar(
      //   centerTitle: true,
      //   title: NeumorphicText(
      //     "Currency Convertor",
      //     style: NeumorphicStyle(
      //       depth: 4,  //customize depth here
      //       color: Colors.white, //customize color here
      //     ),
      //     textStyle: NeumorphicTextStyle(
      //       fontSize: 25, //customize size here
      //       // AND others usual text style properties (fontFamily, fontWeight, ...)
      //     ),
      //   ),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         themeController.themeMode(false);
      //         setState(() {});
      //       },
      //       icon: Get.isDarkMode
      //           ? const Icon(Icons.light_mode)
      //           : const Icon(Icons.dark_mode_rounded),
      //     ),
      //   ],
      // ),

      AppBar(
         leading:   IconButton(
           onPressed: () {
             setState(() {
               (Get.isDarkMode)
                   ? Get.changeThemeMode(ThemeMode.light)
                   : Get.changeThemeMode(ThemeMode.dark);
             });
           },
           icon: Get.isDarkMode
               ?  Icon(Icons.sunny)
               :  Icon(Icons.dark_mode_rounded,color: Colors.black,),
         ),
       // title:
       // ClayContainer(
       //    // color: baseColor,
       //    child: Padding(
       //      padding: EdgeInsets.all(10),
       //      child: ClayText("Seize the Clay!", emboss: false, size: 20),
       //    ),
       //  ),

        centerTitle: true,
        backgroundColor: Get.isDarkMode ? Color(0xFF292D32) : baseColor,
        title: NeumorphicText(
          "Currency Convertor",
          style: NeumorphicStyle(
            depth: Get.isDarkMode ? 1.2 : 4,
            color: Colors.orange[500],
          ),
          textStyle: NeumorphicTextStyle(
            fontSize: 25,
            letterSpacing: 1,
          ),
        ),

          actions: [
             IconButton(onPressed: () {
               Get.toNamed("\Search");
             }, icon: Icon(Icons.search,color: Get.isDarkMode ? Colors.white : Colors.black,))
          ],
      ),
      backgroundColor: Get.isDarkMode ? Color(0xFF292D32) : baseColor,
      body: FutureBuilder(
        future: future,
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Center(
              child: Text(
                "${snapShot.error}",
              ),
            );
          } else if (snapShot.hasData) {
            Currency? data = snapShot.data;

            return Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 15,bottom: 15),
              child: Column(

                children: [
                  // SizedBox(
                  //   height: h * 0.03,
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,top: 0,right: 10),
                    child: Row(
                      children: [
                        (Get.isDarkMode ) ? Text(
                          " Amount",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ) :  Text(
                          " Amount",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      // padding: const EdgeInsets.only(left: 10,top: 5,right: 10,bottom: 30),
                      child: Get.isDarkMode ?
                      Padding(
                        padding: const EdgeInsets.only(left: 10,top: 5,right: 10,bottom: 20),
                        child: Container(
                          // height: 100,
                          // width: double.infinity,
                          alignment:Alignment.center,
                          child: Center(
                            child: TextField(
                              showCursor: true,
                              readOnly: true,
                              controller: textEditingController,
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 18,color: Colors.white),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(20),
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
                      )
                      : Padding(
                        padding: const EdgeInsets.only(left: 10,top: 5,right: 10,bottom: 30),
                        child: Container(
                          // height: 100,
                          // width: 200,
                          alignment:Alignment.center,
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.grey.shade50,
                            shape: BoxShape.rectangle,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade300,
                                  spreadRadius: 0.0,
                                  blurRadius:10,
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
                          child: TextField(
                            showCursor: true,
                            readOnly: true,
                            controller: textEditingController,
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: 18,color: Colors.black),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),



                  // Padding(
                  //   padding: const EdgeInsets.only(left: 20.0,right: 20),
                  //   child: Container(
                  //     height: 100,
                  //     width: 200,
                  //     alignment:Alignment.center,
                  //     decoration:BoxDecoration(
                  //       borderRadius: BorderRadius.circular(20.0),
                  //       color: Colors.grey.shade50,
                  //       shape: BoxShape.rectangle,
                  //       boxShadow: [
                  //         BoxShadow(
                  //             color: Colors.grey.shade300,
                  //             spreadRadius: 0.0,
                  //             blurRadius:10,
                  //             offset: Offset(3.0, 3.0)),
                  //         BoxShadow(
                  //             color: Colors.grey.shade400,
                  //             spreadRadius: 0.0,
                  //             blurRadius: 10 / 2.0,
                  //             offset: Offset(3.0, 3.0)),
                  //         BoxShadow(
                  //             color: Colors.white,
                  //             spreadRadius: 2.0,
                  //             blurRadius: 10,
                  //             offset: Offset(-3.0, -3.0)),
                  //         BoxShadow(
                  //             color: Colors.white,
                  //             spreadRadius: 2.0,
                  //             blurRadius: 10 / 2,
                  //             offset: Offset(-3.0, -3.0)),
                  //       ],
                  //     ),
                  //     child: Center(
                  //       child: Text(
                  //         "Result: ${data!.result}",
                  //         style: const TextStyle(
                  //           fontSize: 25,
                  //           color: Colors.orange,
                  //           letterSpacing: 2,
                  //           fontWeight: FontWeight.w600,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),



                  // SizedBox(
                  //   height: h * 0.02,
                  // ),

                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              (Get.isDarkMode) ? Text(
                                " From",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ) : Text(
                                " From",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              // SizedBox(
                              //   height: h * 0.02,
                              // ),

                              Padding(
                                // padding: const EdgeInsets.only(top: 8.0,bottom: 8,left: 200,right: 8),
                                padding: EdgeInsets.all(0),
                                child: Card(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                  color: Colors.white,
                                  shadowColor: Colors.grey[100],
                                  elevation: 4,
                                  semanticContainer: true,
                                  child: CustomSearchableDropDown(
                                    items: Global.CURENCY,
                                    label: fromCurrency,
                                    labelStyle: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black,fontWeight: FontWeight.w400,fontSize: 18),
                                    decoration: Get.isDarkMode ? BoxDecoration(
                                        color:   Color(0xFF292D32),
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: Colors.transparent,
                                        )
                                    ) : BoxDecoration(
                                        color:   Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          color: Colors.transparent,
                                        )
                                    ),
                                    dropDownMenuItems: Global.CURENCY?.map((e) {
                                      return e;
                                    })?.toList() ??
                                        [],
                                    dropdownBackgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
                                    onChanged: (value){
                                      setState(() {
                                        fromCurrency = value;
                                      });
                                      // if(value!=null)
                                      // {
                                      //   selected = value['class'].toString();
                                      // }
                                      // else{
                                      //   selected=null;
                                      // }
                                    },
                                  ),
                                ),
                              ),



                              // DropdownButtonFormField(
                              //   decoration: InputDecoration(
                              //     border: OutlineInputBorder(
                              //       borderRadius: BorderRadius.circular(20),
                              //     ),
                              //   ),
                              //   value: fromCurrency,
                              //   onChanged: (val) {
                              //     setState(() {
                              //       fromCurrency = val!;
                              //     });
                              //   },
                              //   items: Global.CURENCY.map((e) {
                              //     return DropdownMenuItem(
                              //       value: e,
                              //       child: Text(e),
                              //     );
                              //   }).toList(),
                              // ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              (Get.isDarkMode) ? Text(
                                " To",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ) : Text(
                                " To",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              // SizedBox(
                              //   height: h * 0.02,
                              // ),


                              Padding(
                                // padding: const EdgeInsets.only(top: 8.0,bottom: 8,left: 200,right: 8),
                                padding: EdgeInsets.all(0),
                                child: Card(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                  color:  Colors.white,
                                  shadowColor: Colors.grey[100],
                                  elevation: 4,
                                  semanticContainer: true,
                                  child: CustomSearchableDropDown(
                                    items: Global.CURENCY,
                                    label: toCurrency,
                                    labelStyle: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black,fontWeight: FontWeight.w400,fontSize: 18),
                                    decoration: Get.isDarkMode ? BoxDecoration(
                                      color:  Color(0xFF292D32),
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: Colors.transparent,
                                        )
                                    ) : BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          color: Colors.transparent,
                                        )
                                    ),
                                    dropDownMenuItems: Global.CURENCY?.map((e) {
                                      return e;
                                    })?.toList() ??
                                        [],
                                    dropdownBackgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
                                    onChanged: (value){
                                      setState(() {
                                        toCurrency = value;
                                      });
                                      // if(value!=null)
                                      // {
                                      //   toCurrency = value['class'].toString();
                                      // }
                                      // else{
                                      //   // toCurrency = null;
                                      // }
                                    },
                                  ),
                                ),
                              ),


                              // DropdownButtonFormField(
                              //   decoration: InputDecoration(
                              //     border: OutlineInputBorder(
                              //       borderRadius: BorderRadius.circular(20),
                              //     ),
                              //   ),
                              //   value: toCurrency,
                              //   onChanged: (val) {
                              //     setState(() {
                              //       toCurrency = val!;
                              //     });
                              //   },
                              //   items: Global.CURENCY.map((e) {
                              //     return DropdownMenuItem(
                              //       value: e,
                              //       child: Center(
                              //           child: Column(
                              //             children: [
                              //               Text(e),
                              //               Divider(
                              //                 thickness: 1,
                              //                 color: Colors.grey,
                              //                   indent: 0.1,
                              //                 endIndent: 1,
                              //               ),
                              //             ],
                              //           ),
                              //       ),
                              //     );
                              //   }).toList(),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: h * 0.02,
                  ),
                   Padding(
                     padding: const EdgeInsets.only(left: 10.0,right: 10),
                     child: Get.isDarkMode
                         ? Container(
                         height: 100,
                         width: double.infinity,
                         child: Center(
                           child: NeumorphicText(
                             "${data!.result}",
                             style: NeumorphicStyle(
                               depth: 1,
                               color: Colors.orange.shade400,
                             ),
                             textStyle: NeumorphicTextStyle(
                               fontSize: 35,
                             ),
                           ),
                         ),
                         decoration: BoxDecoration(
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
                   )
                         : Container(
                       height: 90,
                       width: MediaQuery.of(context).size.width,
                       alignment:Alignment.center,
                       decoration:BoxDecoration(
                         borderRadius: BorderRadius.circular(20.0),
                         color: Colors.grey.shade50,
                         shape: BoxShape.rectangle,
                         boxShadow: [
                           BoxShadow(
                               color: Colors.grey.shade300,
                               spreadRadius: 0.0,
                               blurRadius:10,
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
                       child: Center(
                         child: NeumorphicText(
                           "${data!.result}",
                           style: NeumorphicStyle(
                             depth: 3,
                             color: Colors.orange.shade400,
                           ),
                           textStyle: NeumorphicTextStyle(
                             fontSize: 35,
                           ),
                         ),
                         // Text(
                         //   "Result: ${data!.result}",
                         //   style: const TextStyle(
                         //     fontSize: 25,
                         //     color: Colors.orange,
                         //     letterSpacing: 2,
                         //     fontWeight: FontWeight.w600,
                         //   ),
                         // ),
                       ),
                     ),

                     // NeumorphicContainer(
                     //   height: 100,
                     //   width: 100,
                     //   borderRadius: 150,
                     //   depth: 20,
                     //   //flat neumorphism design
                     //   curvature: Curvature.flat,
                     //   child: Center(
                     //     child: Text(
                     //       "Result: ${data!.result}",
                     //       style: const TextStyle(
                     //         fontSize: 25,
                     //         color: Colors.orange,
                     //         letterSpacing: 2,
                     //         fontWeight: FontWeight.w600,
                     //       ),
                     //     ),
                     //   ),
                     // ),

                       // Container(
                       //      alignment: Alignment.center,
                       //      height: h * 0.1,
                       //      width: w * 0.7,
                       //      decoration: BoxDecoration(
                       //        color:  Colors.white,
                       //        borderRadius: BorderRadius.circular(20),
                       //          boxShadow: [
                       //            const BoxShadow(
                       //              color: Color(0xFFBEBEBE),
                       //              offset: Offset(10, 10),
                       //              blurRadius: 30,
                       //              spreadRadius: 1,
                       //            ),
                       //            const BoxShadow(
                       //              color: Colors.white,
                       //              offset: Offset(-20, -20),
                       //              blurRadius: 30,
                       //              spreadRadius: 1,
                       //            ),
                       //          ]
                       //      ),
                       //      child: Text(
                       //        "Result: ${data!.result}",
                       //        style: const TextStyle(
                       //          fontSize: 20,
                       //          color: Colors.white,
                       //          letterSpacing: 2,
                       //          fontWeight: FontWeight.w600,
                       //        ),
                       //      ),
                       //    ),
                   ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     int amt = int.parse(textEditingController.text);
                  //     setState(() {
                  //       future = ApiHelper.apiHelper
                  //           .fetchData(
                  //         from: fromCurrency,
                  //         to: toCurrency,
                  //         amount: amt,
                  //       );
                  //     });
                  //   },
                  //   child: Container(
                  //     alignment: Alignment.center,
                  //     height: h * 0.07,
                  //     width: w * 0.7,
                  //     decoration: BoxDecoration(
                  //       color: Colors.blue,
                  //       borderRadius: BorderRadius.circular(20),
                  //     ),
                  //     child: const Text(
                  //       "CONVERT",
                  //       style: TextStyle(
                  //         fontSize: 20,
                  //         fontWeight: FontWeight.w600,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  NumPad(
                    buttonSize: 75,
                    buttonColor: Colors.purple,
                    iconColor: Colors.deepOrange,
                    controller: textEditingController,
                    delete: () {
                      textEditingController.text = textEditingController.text
                          .substring(0, textEditingController.text.length - 1);
                    },
                    // do something with the input numbers
                    onSubmit: () {
                      debugPrint('Your code: ${textEditingController.text}');

                      int amt = int.parse(textEditingController.text);
                      setState(() {
                        // truedata = true;
                        future = ApiHelper.apiHelper.fetchData(
                          from: fromCurrency,
                          to: toCurrency,
                          amount: amt,
                        );
                      });
                      // showDialog(
                      //     context: context,
                      //     builder: (_) => AlertDialog(
                      //       content: Text(
                      //         "You code is ${textEditingController.text}",
                      //         style: const TextStyle(fontSize: 30),
                      //       ),
                      //     ));
                    },
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(color: Colors.black,),
          );
        },
      ),
      // backgroundColor: Colors.white,
    );
  }
}
