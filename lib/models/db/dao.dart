import 'package:moor/moor.dart';
import 'package:newfeedapp/models/db/db.dart';
//moor webはエラー発生するので要削除

part 'dao.g.dart';

@UseDao(tables:[ArticleRecords])
class NewsDao extends DatabaseAccessor<MyDatabase> with _$NewsDaoMixin{
  NewsDao(MyDatabase db) : super(db);
Future clearDB()=>delete(articleRecords).go();
Future insertDB(List<ArticleRecord>articles)async{
  await batch((batch){
    batch.insertAll(articleRecords, articles);
  });
  }
Future <List<ArticleRecord>>get articlesFromDB=>select(articleRecords).get();
Future <List<ArticleRecord>>insertAndNewsFromDB(List<ArticleRecord>articles)=>transaction(()async{
  await clearDB();
  await insertDB(articles);
  return await articlesFromDB;
});

}