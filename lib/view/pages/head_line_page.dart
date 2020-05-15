import 'package:flutter/material.dart';
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
        body: Consumer<HeadLineViewModel>(
         builder: (context,model,child) {
           return PageView.builder(
             controller: PageController(initialPage: 0),
             itemCount: model.articles.length,
             itemBuilder: (context,index){
               final article=model.articles[index];
               return Container(
                 color: Colors.cyanAccent,
                 child: Center(
                   child: Column(
                     children: <Widget>[
                       Text(article.title),
                     Text(article.description),
                     ],
                   ),
                 ),
               );
             },
           );
         },
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
}
