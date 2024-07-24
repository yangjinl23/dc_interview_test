import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/language_model.dart';
import '../utils/logger.dart';

class ApiService {
  final String baseUrl = 'https://frontend-test-api.digitalcreative.cn/';

  Future<List<LanguageModel>> fetchLanguages(String searchText,
      {bool noThrottling = true}) async {
    final url = Uri.parse(baseUrl).replace(queryParameters: {
      'no-throttling': noThrottling ? 'true' : 'false',
      'search': searchText,
    });

    HiLog.d("requested url is  $url");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => LanguageModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
