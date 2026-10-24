import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/use%20_cases/fetch_featured_books_use_case.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/book_entity.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;
  FeaturedBooksCubit(this.fetchFeaturedBooksUseCase) : super(FeaturedBooksInitial());
  Future<void> fetchFeaturedBooks({int pageNumber=0}) async {

    if (pageNumber==0) {
      emit(FeaturedBooksLoading());
    }else{
      emit(FeaturedBooksPaginationLoading());
    }

  var result = await  fetchFeaturedBooksUseCase.call(pageNumber);
    result.fold((failure) {
      if (pageNumber ==0) {
        emit(FeaturedBooksFailure(failure.message));
      }else{
        emit(FeaturedPaginationFailure(failure.message));
      }
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }

}