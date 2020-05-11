import 'package:flutter/material.dart';
import 'package:newfeedapp/view/screens/data/category_info.dart';
import 'package:newfeedapp/view/screens/conponents/category_tips.dart';
import 'package:newfeedapp/view/screens/conponents/search_bar.dart';
import 'package:newfeedapp/view/screens/data/search_type.dart';
import 'package:newfeedapp/viewmodels/news_list_view.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          tooltip: '更新',
          onPressed: () => onRefresh(context),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SearchBar(
                  onSearch: (keyword) => getKeyWordNews(context, keyword)),
              CategoryTips(
                onCategoryChanged: (category) =>
                    _getCategory(context, category),
              ), //todo検索ワードカテゴリー作成
              //todo 記事表示
              Expanded(child: Center(child: CircularProgressIndicator(
              ))),
            ],
          ),
        ),
      ),
    );
  }

//todo
 Future<void> onRefresh(BuildContext context) async{
    final viewModel=Provider.of<NewsListViewModel>(context,listen: false);
   await viewModel.getNews(searchType:viewModel.searchType,keyword: viewModel.keyword,category: viewModel.category);
  }
//todo カテゴリー
  Future<void>  _getCategory(BuildContext context, Category category)async {
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
  await  viewModel.getNews(searchType: SearchType.CATEGORY, category: category,);
  }

//todo キーワード記事取得処理
 Future<void> getKeyWordNews(BuildContext context, keyword) async{
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
  await  viewModel.getNews(searchType: SearchType.KEYWORD,
        keyword: keyword,
        category: categories[0]);
  }


}
