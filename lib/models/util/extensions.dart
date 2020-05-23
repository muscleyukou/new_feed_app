import 'package:flutter/cupertino.dart';
import 'package:newfeedapp/models/db/db.dart';
import 'package:newfeedapp/models/model/news_model.dart';
import 'package:path/path.dart';

//Dartのモデルクラス＝＞DBテーブルクラス
extension ConvertToArticleRecord on List<Article> {
  List<ArticleRecord> toArticleRecords(List<Article> articles) {
    var articlesRecords = List<ArticleRecord>();
    articles.forEach((article) {
      articlesRecords.add(
          ArticleRecord(
          title: article.title ?? "",
          description: article.description ?? "",
          url: article.url,
          urlToImage: article.urlToImage??"",
          publishDate: article.publishDate ?? "",
          content: article.content ?? ""));
    });
    return articlesRecords;
  }
}

//DBテーブルクラスからDBモデルクラス
extension ConvertToArticle on List<ArticleRecord> {
  List<Article> toArticles(List<ArticleRecord> articleRecords) {
    var articles = List<Article>();
    articleRecords.forEach((articleRecord) {
      articles.add(Article(
          title: articleRecord.title ?? "",
          description: articleRecord.description ?? "",
          url: articleRecord.url,
          publishDate: articleRecord.publishDate ?? "",
          content: articleRecord.content ?? "",
        urlToImage: articleRecord.urlToImage??"",));

    });
    return articles;
  }
}
