import 'package:flutter/material.dart';
import 'package:newfeedapp/view/screens/conponents/category_info.dart';
import 'package:newfeedapp/view/screens/conponents/category_tips.dart';
import 'package:newfeedapp/view/screens/conponents/search_bar.dart';

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
           SearchBar(onSearch:(keyword)=>getKeyWordNews(context,keyword)),
              CategoryTips(
                onCategoryChanged: (category)=>_getCategory(context,category),
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
  onRefresh(BuildContext context) {
    print('onRefresh');
  }

  _getCategory(BuildContext context,Category category) {
    print('getCategory');
  }
//todo キーワード記事取得処理
  getKeyWordNews(BuildContext context, keyword) {
    print('キーワード取得完了');
  }

  
}
