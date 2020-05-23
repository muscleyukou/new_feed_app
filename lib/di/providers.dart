import 'package:flutter/material.dart';
import 'package:newfeedapp/models/db/dao.dart';
import 'package:newfeedapp/models/db/db.dart';
import 'package:newfeedapp/models/networking/api_services.dart';
import 'package:newfeedapp/models/repository/news_repository.dart';
import 'package:newfeedapp/viewmodels/head_line_viewmodel.dart';
import 'package:newfeedapp/viewmodels/news_list_view.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> globalProviders=[
  ...independentModels,
  ...dependentModels,
  ...viewModels,
];
List<SingleChildWidget> independentModels=[

  Provider<ApiService>(
    create: (_)=>ApiService.create(),
    dispose: (_,apiService)=>apiService.dispose(),
  ),
  Provider<MyDatabase>(
    create: (_)=>MyDatabase(),
    dispose: (_,db)=>db.close(),
  )
];

List dependentModels=[
  ProxyProvider<MyDatabase,NewsDao>(
    update: (_,db,dao)=>NewsDao(db),
  ),
  ProxyProvider2<NewsDao,ApiService,NewsRepository>(update:
  (_,dao,apiService,repository)=>
      NewsRepository(dao:dao,apiService:apiService)),
];

List viewModels=[
  ChangeNotifierProvider<HeadLineViewModel>(create:
  (context)=>HeadLineViewModel(
    repository: Provider.of<NewsRepository>(context,listen: false),
  ),
  ),
  ChangeNotifierProvider<NewsListViewModel>(
create:(context)=>NewsListViewModel(repository: Provider.of<NewsRepository>(context,listen: false)),
  ),

];

