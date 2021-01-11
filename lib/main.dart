import 'package:flutter/material.dart';
import 'package:newsapp/pages/newsListPage.dart';
import 'package:newsapp/viewmodels/newsArticlesListViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>NewsArticleListViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NewsApp',
        home: NewsListPage(),        
      ),
    );
  }
}
