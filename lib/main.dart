import 'package:flutter/material.dart';
import 'package:flutter_provider_app/viewmodels/news_list_model.dart';
import 'package:provider/provider.dart';
import 'view/screens/home_screen.dart';

void main() {
  runApp(ChangeNotifierProvider<NewsListModel>(
    create: (context) => NewsListModel(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NewsFeed",
      theme: ThemeData(brightness: Brightness.dark),
      home: HomeScreen(),
    );
  }
}
