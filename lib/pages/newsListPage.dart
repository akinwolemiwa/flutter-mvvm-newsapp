

import 'package:flutter/material.dart';
import 'package:newsapp/viewmodels/newsArticleViewModel.dart';
import 'package:newsapp/viewmodels/newsArticlesListViewModel.dart';
import 'package:newsapp/widgets/newList.dart';
import 'package:provider/provider.dart';

import 'newsArticleDetailsPage.dart';

class NewsListPage extends StatefulWidget {
  @override 
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {

  @override
  void initState() {
    super.initState();


    Provider.of<NewsArticleListViewModel>(context, listen: false)
    .populateTopHeadlines();
  }
  
    void _showNewsArticleDetails(BuildContext context, NewsArticleViewModel article) {

    Navigator.push(context, MaterialPageRoute(
      builder: (context) => NewsArticleDetailsPage(article: article))
    );

  }

  Widget _buildList(BuildContext context,NewsArticleListViewModel vm) {

    switch(vm.loadingStatus){
      case LoadingStatus.searching:
       return Align(child: CircularProgressIndicator());
      case LoadingStatus.empty:
       return Align(child: Text('No Results Found'));
      case LoadingStatus.completed:
       return Expanded(child: NewsList(
         articles: vm.articles,
         onSelected: (article) {
           _showNewsArticleDetails(context, article);
         },
         ));
    }
  }

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final vm = Provider.of<NewsArticleListViewModel>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black45,
          elevation: .0,
          centerTitle: true,
          title: Text('Latest News'),
        ),
        body: Column(children: <Widget>[
          TextField(
            controller: _controller,
            onSubmitted: (value) {
              if(value.isNotEmpty) {
              vm.search(value);
              }

            },
            decoration: InputDecoration(
              labelText: 'Enter Search',
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.search),
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: (){
                  _controller.clear();
                },
              ),
            ),
          ),

          _buildList(context,vm)
        ])
      );
  }
}