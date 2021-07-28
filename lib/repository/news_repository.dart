import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_provider_app/data/category_info.dart';
import 'package:flutter_provider_app/data/search_type.dart';
import 'package:flutter_provider_app/models/model/news_model.dart';
import 'package:http/http.dart' as http;

class NewsRepository {
  static const BASE_URL = "https://newsapi.org/v2/top-headlines?country=jp";
  static const API_KEY = "5276c7eaa9ff4f5bb7e85bcec9ea11e1";

  Future<void> getNews(
      {@required SearchType searchType,
      String keyword,
      Category category}) async {
    List<Article> results = [];

    http.Response response;

    switch (searchType) {
      case SearchType.HEAD_LINE:
        final requestUrl = Uri.parse(BASE_URL + "&apiKey=$API_KEY");
        response = await http.get(requestUrl);
        break;
      case SearchType.KEYWORD:
        final requestUrl = Uri.parse(BASE_URL + "&q=$keyword&apiKey=$API_KEY");
        response = await http.get(requestUrl);
        break;
      case SearchType.CATEGORY:
        final requestUrl = Uri.parse(
            BASE_URL + "&category=${category.nameEn}&apiKey=$API_KEY");
        response = await http.get(requestUrl);
        break;
    }

    if (response.statusCode == 200) {
      final responseBody = response.body;
      results = News.fromJson(jsonDecode(responseBody)).articles;
    } else {
      throw Exception('Non Data');
    }
    return results;
  }
}
