import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model_class/api2_model.dart';
import '../model_class/api_model.dart';


class ApiHelperAll {
  ApiHelperAll._();

  static final ApiHelperAll apiHelperall = ApiHelperAll._();

  Future<List<CurrencyAll>?> fetchDataAll({String pacl = "latest"}) async {

  String k = pacl;

    String url =
        "https://api.currencyapi.com/v3/latest?apikey=LW73JB84Hvwg7cEacg7nLKca1BY2kqC9cRl7Y8Bb";

    http.Response res = await http.get(Uri.parse(url));


    if(res.statusCode == 200) {
      Map decodedData = jsonDecode(res.body);
      List<CurrencyAll> list = [];
      print("ok");
      (decodedData['data'] as Map).forEach((key, value) {
        CurrencyAll currencyall = CurrencyAll.fromMap(dataall: value);
        list.add(currencyall);
      });
      return list;
    }
    // if (res.statusCode == 200) {
    //   Map<String, dynamic> decodedData = jsonDecode(res.body);
    //
    //   List data = decodedData['data'];
    //   List<CurrencyAll> k1 = data.map((e) => CurrencyAll.fromMap(dataall: e),).toList();
    //
    //   return k1;
    // }
    return null;
  }
}
