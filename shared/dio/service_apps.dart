// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class ServiceApps {
//   static var basuUrl = "https://newsapi.org";

//   // static Future<http.Response> getData(
//   //     //   {
//   //     //   required String url,
//   //     //   required Map<String, dynamic> query,
//   //     // }
//   //     ) async {
//   //   Uri url = Uri.parse(
//   //       '$basuUrl/v2/top-headline?country=us&category=business&apiKey=5649968ceb9e4f3fa1812c95ea6d3a54');
//   //   // return await http.get(url);
//   //   http.Response response = await http.get(url);
//   //   // print(response.body);
//   //   List<Map<String, dynamic>> data = jsonDecode(response.body);
//   //   // print(data);
//   //   return response;
//   // }
// }

import 'package:shared_preferences/shared_preferences.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

class CacheHelper {
  static SharedPreferences? sh;

  static initCache() async {
    sh = await SharedPreferences.getInstance();
  }

  static Future<bool> putDataCache({
    required String key,
    required bool value,
  }) async {
    return await sh!.setBool(key, value);
  }

  static bool? getDataCache({
    required String key,
  }) {
    return sh!.getBool(key);
  }

  //-------------------------
  // static GetStorage? getStorage;
  // static initCache() async {
  //   getStorage = await GetStorage();
  // }

  // Future<void> putData({
  //   required String key,
  //   required bool value,
  // }){
  //   getStorage!.write(key, value);
  // }
}
