
import 'package:flutter/material.dart';
import 'package:newsapp/pages/newsArticleDetailsPage.dart';
import 'package:newsapp/viewmodels/newsArticleViewModel.dart';

class NewsList extends StatelessWidget {


final List<NewsArticleViewModel> articles;
final Function(NewsArticleViewModel article) onSelected;



NewsList({this.articles, this.onSelected});



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {

            final article = articles[index];

            return ListTile(
              onTap: () {
                this.onSelected(article);
              },
              leading: Container(
                width: 75,
                height: 75,
                child: article.imageURL == null ? Image.asset('images/download.jpg') : Image.network(article.imageURL)),
              title: Text(articles[index].title),
            );
          });
  }


}
