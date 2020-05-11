import 'package:flutter/material.dart';
import 'package:newfeedapp/view/screens/data/category_info.dart';
import 'package:newfeedapp/view/screens/data/search_type.dart';

class NewsRepository{
 Future<void> getNews({@required SearchType searchType,String keyword,Category category})async{
    //todo
    print('repository:searchType:$searchType/keyword:$keyword/category:${category.categoryJp}');
  }
}