import 'package:hive/hive.dart';

import '../../../../constants.dart';
import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource{
  //هحدد فيه ايه اللي هيحصل بس مش هقول هيحصل ازاي زي اللي عملناه في الهوم ريبو بالظبطططط
  // وهنا مش هحتاج استعمل الايزر كلاس لان هنا مش بحدد الميثود تمت بشكل صحيح ولا فشلت اللي بيحدد ده الهوم ريبو انما الداتا سورس مسئول عن انه يجيب البيانات بس مش انه يقولنا البيناات جات بطريقه صح ولا لا



  List<BookEntity>fetchFeaturedBooks({int pageNumber=0});
  List<BookEntity>fetchNewestBooks();

}


class HomeLocalDataSourceImpl extends HomeLocalDataSource{
  @override
  List<BookEntity> fetchFeaturedBooks({ int pageNumber = 0 }) {
    int startIndex=pageNumber*10;
    int endIndex= (pageNumber+1)*10;

     var box = Hive.box<BookEntity>(kFeaturedBox);
    int length=box.values.length;
    //endindex=51;
    //length=50 endindex=49
    if(startIndex>=length || endIndex > length){
      return [];
    }
    return  box.values.toList().sublist(startIndex,endIndex);

  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(kNewestBox);
    return  box.values.toList();

  }
}