import 'package:flutter/material.dart';
import 'package:flutter_provider_app/models/model/news_model.dart';
import 'package:flutter_provider_app/repository/news_repository.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider_app/data/category_info.dart';
import 'package:flutter_provider_app/data/search_type.dart';
import 'package:flutter_provider_app/view/components/search_bar.dart';
import 'package:flutter_provider_app/view/components/category_chips.dart';
import 'package:flutter_provider_app/viewmodels/news_list_model.dart';

class NewsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);

    if (!viewModel.isLoading) {
      Future(
        () => viewModel.getNews(
          searchType: SearchType.CATEGORY,
          category: categories[0],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          tooltip: "更新",
          onPressed: () => onRefresh(context),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SearchBar(
                onSearch: (keyword) => getKeywordNews(context, keyword),
              ),
              CategoryChips(
                onCategorySelected: (category) =>
                    getCategoryNews(context, category),
              ),
              Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 更新処理
  Future<void> onRefresh(BuildContext context) async {
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await viewModel.getNews(
      searchType: viewModel.searchType,
      keyword: viewModel.keyword,
      category: viewModel.category,
    );
  }

  // キーワード記事取得処理
  Future<void> getKeywordNews(BuildContext context, keyword) async {
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await viewModel.getNews(
      searchType: SearchType.KEYWORD,
      keyword: keyword,
      category: categories[0],
    );
  }

  // カテゴリー記事選択処理
  Future<void> getCategoryNews(BuildContext context, category) async {
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await viewModel.getNews(
      searchType: SearchType.CATEGORY,
      category: category,
    );
  }
}
