
import 'package:flutter/material.dart';
import 'package:newfeedapp/models/model/news_model.dart';
import 'package:newfeedapp/view/conponents/article_description.dart';
import 'package:newfeedapp/view/conponents/image_url.dart';
class ArticleTile extends StatelessWidget {

const  ArticleTile({this.article,this.onArticleClicked});
  final Article article;
 final ValueChanged onArticleClicked;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 9.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: ()=>onArticleClicked(article),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageFromUrl(imageUrl: article.urlToImage,),
                ) ,
              ),
              Expanded(
                flex: 3,
                child:ArticleTileDesc(
                  article: article,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
