
import 'package:flutter/material.dart';
import 'package:newfeedapp/models/model/news_model.dart';
import 'package:newfeedapp/view/style/style.dart';

class ArticleTileDesc extends StatelessWidget {

  final Article article;
  const ArticleTileDesc({this.article});
  @override
  Widget build(BuildContext context) {
    final textTheme=Theme.of(context).textTheme;
    var displayDesc="";
    if(article.description!=null){
      displayDesc=article.description;
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(article.title,style: textTheme.subhead.copyWith(
            fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 2.0,),
          Text(article.publishDate,style: textTheme.overline.copyWith(
            fontStyle: FontStyle.italic
          ),),
          SizedBox(height: 2.0,),
          Text(displayDesc,style: textTheme.body1.copyWith(
            fontFamily: RegularFont
          ),),
        ],
      ),
    );
  }
}
