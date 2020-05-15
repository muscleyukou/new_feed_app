import 'package:flutter/material.dart';
import 'package:newfeedapp/models/model/news_model.dart';
import 'package:newfeedapp/view/conponents/head_line_item.dart';
import 'package:newfeedapp/view/conponents/transition.dart';
import 'package:newfeedapp/view/data/search_type.dart';
import 'package:newfeedapp/viewmodels/head_line_viewmodel.dart';
import 'package:provider/provider.dart';

class HeadLinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel=Provider.of<HeadLineViewModel>(context,listen: false);
    if(!viewModel.isLoading&&viewModel.articles.isEmpty){
      Future(()=>viewModel.getHeadLines(searchType: SearchType.HEAD_LINE));
    }
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<HeadLineViewModel>(
           builder: (context,model,child) {
             return PageTransformer(
               pageViewBuilder: (context,pageVisibilityResolver){
                 return
                   PageView.builder(
                     controller: PageController(viewportFraction: 0.85),
                     itemCount: model.articles.length,
                     itemBuilder: (context,index){
                       final article=model.articles[index];
                       final pageVisibility= pageVisibilityResolver.resolvePageVisibility(index);
                       final visibleFraction=pageVisibility.visibleFraction;

                       return HeadLineItem(
                         article: model.articles[index],
                         pageVisibility: pageVisibility,
                         onArticleClicked: (article)=>_onArticleWebPage(context,article),
                       );
                     },
                   );
               },
             );
           },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: ()=>onRefresh(context),
        ),
      ),
    );
  }
//todo
  onRefresh(BuildContext context)async {
    final viewModel=Provider.of<HeadLineViewModel>(context,listen: false);
    await viewModel.getHeadLines(searchType: SearchType.HEAD_LINE);
  }

  _onArticleWebPage(BuildContext context,Article article) {
    print('headline${article.url}');
  }
}
