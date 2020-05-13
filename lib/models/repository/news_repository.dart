import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:newfeedapp/models/model/news_model.dart';
import 'package:newfeedapp/models/networking/api_services.dart';
import 'package:newfeedapp/view/data/category_info.dart';
import 'package:newfeedapp/view/data/search_type.dart';

class NewsRepository {
  final ApiService _apiService = ApiService.create();

  List<Article> result;

  Future<List<Article>> getNews(
      {@required SearchType searchType, String keyword, Category category}) async {
    Response response;
    try {
      switch (searchType) {
        case SearchType.HEAD_LINE:
          response = await _apiService.getHeadLines();
          break;
        case SearchType.KEYWORD:
          response = await _apiService.getKeywordNews(keyword: keyword);
          break;
        case SearchType.CATEGORY:
          response =
          await _apiService.getCategoryNews(category: category.categoryEn);
      }
      if (response.isSuccessful) {
        final responseBody = response.body;

        result = News
            .fromJson(responseBody)
            .articles;
        print('response:$responseBody');
      } else {
        final errorCode = response.statusCode;
        final error = response.error;
        print('response is not sucessful :$errorCode/$error');
      }
    } on Exception catch (error) {
      print('error:$error');
    }
    return result;
  }
  void dispose(){
    _apiService.dispose();
  }
}