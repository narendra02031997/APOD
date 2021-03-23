import 'dart:convert';

import 'package:apod/model/ApodResponseModel.dart';
import 'package:apod/utils/url/url.dart';
import 'package:http/http.dart' as http;

class RestApi {
  Future<ApodResponseModel?> getApodData({required String date}) async {
    var response = await http.get(getApodDataUrl(date: date));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return ApodResponseModel.fromJsonMap(data);
    } else {
      return null;
    }
  }
}
