import 'package:json_annotation/json_annotation.dart';
part 'news_model.g.dart';
@JsonSerializable()
class News{
 final List<Article>article;
 News({this.article});
 factory News.fromJson(Map<String, dynamic> json/*この部分()は自動でcode生成*/) => _$NewsFromJson(json);
 Map<String, dynamic> toJson() => _$NewsToJson(this);
}
@JsonSerializable()
class Article {
 @JsonKey(name:'publishedAt') final publishDate;
  final title;
  final description;
  final url;
  final urlToImage;
  final content;


  Article({this.title,this.description,this.url,this.urlToImage,this.publishDate,this.content});
 factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);
 Map<String, dynamic> toJson() => _$ArticleToJson(this);
}