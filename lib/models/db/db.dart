import 'dart:io';
import 'package:newfeedapp/models/db/dao.dart';
import 'package:path/path.dart'as p;
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
part 'db.g.dart';

class ArticleRecords extends Table {
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get url => text()();
  TextColumn get urlToImage => text()();
  TextColumn get publishDate => text()();
  TextColumn get content => text()();

  @override
  Set<Column> get primaryKey => {url};
}
@UseMoor(tables:[ArticleRecords],daos: [NewsDao])
class MyDatabase extends _$MyDatabase{
  MyDatabase() : super(_openConnection());//create functionの方

  @override
  // TODO: implement schemaVersion
  int get schemaVersion => 1;
 

}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'news_db'));
    //Fileをoption+enterする際は、dart.ioを選択する
    return VmDatabase(file);
  });
}
