import 'dart:convert';

import 'package:flutter_app/app/model/home_model.dart';
import 'package:flutter_app/app/model/travel_tab_model.dart';
import 'package:http/http.dart' as http;

const TRAVEL_TAB_URL =
    'http://www.devio.org/io/flutter_app/json/travel_page.json';

class TravelTabDao {
  // 获取首页接口数据
  static Future<TravelTabModel> fetch() async {
    var response = await http.get(TRAVEL_TAB_URL);
    if (response.statusCode == 200) {
      // 服务器接口中包含中文，且用的是UTF-8编码
      // 这里用UTF-8解码，避免乱码
      Utf8Decoder utf8decoder = Utf8Decoder();
      String result = utf8decoder.convert(response.bodyBytes);
      Map<String, Object> map = json.decode(result);
      return TravelTabModel.fromJson(map);
    } else {
      throw Exception('fetch travel tab data failed.');
    }
  }
}
