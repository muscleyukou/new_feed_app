import 'package:flutter/cupertino.dart';

class Category{
 final int categoryId;
 final String categoryJp;
 final String categoryEn;

  Category({this.categoryId,this.categoryJp,this.categoryEn});
}

final List<Category>categories=[
  Category(categoryId: 0,categoryEn: 'general',categoryJp: '総合'),
  Category(categoryId: 1,categoryEn: 'business',categoryJp: 'ビジネス'),
  Category(categoryId: 2,categoryEn: 'science',categoryJp: 'スポーツ'),
  Category(categoryId: 3,categoryEn: 'technology',categoryJp: 'テクノロジー'),
  Category(categoryId: 4,categoryEn: 'health',categoryJp: '健康'),
  Category(categoryId: 5,categoryEn: 'sports',categoryJp: 'スポーツ'),
  Category(categoryId: 6,categoryEn: 'entertaiment',categoryJp: 'エンタメ'),
];