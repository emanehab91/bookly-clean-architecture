import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/constants.dart';
import 'package:hive/hive.dart';

import '../../../../core/utils/api_services.dart';
import '../../../../core/utils/functions/save_books.dart';
import '../../../../secrets.dart';
import '../models/book_model/Book_model.dart';

abstract class HomeRemoteDataSource{
  //هحدد فيه ايه اللي هيحصل بس مش هقول هيحصل ازاي زي اللي عملناه في الهوم ريبو بالظبطططط
  // وهنا مش هحتاج استعمل الايزر كلاس لان هنا مش بحدد الميثود تمت بشكل صحيح ولا فشلت اللي بيحدد ده الهوم ريبو انما الداتا سورس مسئول عن انه يجيب البيانات بس مش انه يقولنا البيناات جات بطريقه صح ولا لا



  Future<List<BookEntity>>fetchFeaturedBooks({int pageNumber=0});
  Future<List<BookEntity>>fetchNewestBooks();

}



////////////////////////////////////////////////////////////////////

class HomeRemoteDataSourceImpl extends  HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImpl(this.apiService);


  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber =0}) async {
     var data=  await apiService.get(endPoint:'volumes?q=subject:computer science&key=$kApiKey&startIndex=${pageNumber*10}');
     List<BookEntity> books = getBooksList(data);
     saveBooksData(books,kFeaturedBox);
     return books;
  }





  @override
  Future<List<BookEntity>> fetchNewestBooks()  async {

    var data=  await apiService.get(endPoint: 'volumes?q=subject:computer science&key=$kApiKey&orderBy=newest');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books,kNewestBox);

    return books;
  }

//////////


  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity>books=[];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }



}