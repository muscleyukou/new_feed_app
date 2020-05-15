import 'package:flutter/material.dart';
import 'package:newfeedapp/models/model/news_model.dart';
import 'package:newfeedapp/models/repository/news_repository.dart';
import 'package:newfeedapp/view/data/category_info.dart';
import 'package:newfeedapp/view/data/search_type.dart';

class HeadLineViewModel extends ChangeNotifier{
  final NewsRepository _repository = NewsRepository();

  SearchType _searchType = SearchType.CATEGORY;

  SearchType get searchType => _searchType;


  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Article>_articles=List();
  List<Article> get articles=>_articles;

  @override
  void dispose() {
    _repository.dispose();
    super.dispose();
  }

 Future<void> getHeadLines({@required SearchType searchType}) async{
    _searchType=searchType;
    _isLoading=true;
    notifyListeners();
   _articles= await _repository.getNews(searchType: SearchType.HEAD_LINE);
    print('viewmodel:searchType:$_searchType${_articles[0]}');
    _isLoading=false;
    notifyListeners();
  }

}