

import 'package:flutter/material.dart';
import 'package:newfeedapp/models/model/news_model.dart';
import 'package:newfeedapp/view/conponents/image_url.dart';
import 'package:newfeedapp/view/conponents/raise_reload_text.dart';
import 'package:newfeedapp/view/conponents/transition.dart';

class HeadLineItem extends StatelessWidget {
  final PageVisibility pageVisibility;
  final Article article;
  final ValueChanged onArticleClicked;

  HeadLineItem({this.article, this.pageVisibility, this.onArticleClicked});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 8.0,
      child: InkWell(
        onTap: () => onArticleClicked(article),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            DecoratedBox(
              position: DecorationPosition.foreground,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.grey,
                    Colors.black26,
                  ],
                ),
              ),
              child: ImageFromUrl(
                imageUrl: article.urlToImage,
              ),
            ),
            Positioned(
              bottom: 56.0,
              left: 32.0,
              right: 32.0,
              child: LazyLoadText(
                text: article.title,
                pageVisibility: pageVisibility,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
