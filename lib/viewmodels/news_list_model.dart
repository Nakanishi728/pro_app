import 'package:flutter/material.dart';
import 'package:flutter_provider_app/data/category_info.dart';
import 'package:flutter_provider_app/data/search_type.dart';
import 'package:flutter_provider_app/repository/news_repository.dart';

// ChangeNotifierを継承させたプロパティの設定
class NewsListModel extends ChangeNotifier {
  final NewsRepository _repository = NewsRepository();

  SearchType _searchType = SearchType.CATEGORY;

  // searchTypeの値をgetのみで取得できるようにする(カプセル化)
  SearchType get searchType => _searchType;

  Category _category = categories[0];

  Category get category => _category;

  String _keyword = "";

  String get keyword => _keyword;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> getNews(
      {@required SearchType searchType, String keyword, Category category}) async {
    _searchType = searchType;
    _keyword = keyword;
    _category = category;
    _isLoading = true;
    notifyListeners();

    //  TODO
    await _repository.getNews(
      searchType: _searchType,
      keyword: _keyword,
      category: _category,
    );
    _isLoading = false;
    notifyListeners();
  }
}
