import 'package:flutter/material.dart';
import 'package:newfeedapp/models/model/news_model.dart';
import 'package:newfeedapp/view/conponents/articlle_tile.dart';
import 'package:newfeedapp/view/data/category_info.dart';
import 'package:newfeedapp/view/conponents/category_tips.dart';
import 'package:newfeedapp/view/conponents/search_bar.dart';
import 'package:newfeedapp/view/data/search_type.dart';
import 'package:newfeedapp/view/screens/news_webpage_screen.dart';
import 'package:newfeedapp/viewmodels/news_list_view.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    if (viewModel.isLoading && viewModel.articles.isEmpty) {
      Future(() => viewModel.getNews(
          searchType: SearchType.CATEGORY, category: categories[0]));
    }
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
              Expanded(child: Consumer<NewsListViewModel>(
                builder: (context, model, child) {
                  return model.isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: model.articles.length,
                          itemBuilder: (context, int position) => ArticleTile(
                            article: model.articles[position],
                            onArticleClicked: (article) =>
                                _openArticleWebPage(article, context),
                          ),
                        );
                },
              )),
            ],
          ),
        ),
      ),
    );
  }

//todo
  Future<void> onRefresh(BuildContext context) async {
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await viewModel.getNews(
        searchType: viewModel.searchType,
        keyword: viewModel.keyword,
        category: viewModel.category);
  }

//todo カテゴリー
  Future<void> _getCategory(BuildContext context, Category category) async {
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await viewModel.getNews(
      searchType: SearchType.CATEGORY,
      category: category,
    );
  }

//todo キーワード記事取得処理
  Future<void> getKeyWordNews(BuildContext context, keyword) async {
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await viewModel.getNews(
        searchType: SearchType.KEYWORD,
        keyword: keyword,
        category: categories[0]);
  }

  _openArticleWebPage(Article article, BuildContext context) {
    print('${article.url}');
      print('headline${article.url}');
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewsWebPageScreen(article: article)));
  }
}
