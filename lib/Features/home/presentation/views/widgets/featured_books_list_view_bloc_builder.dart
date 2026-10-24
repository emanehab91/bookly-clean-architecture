import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/managers/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/functions/build_error_snack_bar.dart';
import 'featured_box_listview_loading_indicator.dart';
import 'featured_list_view.dart';

class FeaturedBooksListViewConsumer extends StatefulWidget {
  const FeaturedBooksListViewConsumer({
    super.key,
  });

  @override
  State<FeaturedBooksListViewConsumer> createState() => _FeaturedBooksListViewBuilderState();
}

class _FeaturedBooksListViewBuilderState extends State<FeaturedBooksListViewConsumer> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, State) {
        if (State is FeaturedBooksSuccess) {
          books.addAll(State.books);
        }
        if (State is FeaturedPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(build_error_widget(State.errMessage));
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedPaginationFailure) {
          return FeaturedBooksListView(books: books);
        } else if (state is FeaturedBooksFailure) {
          return Text(state.errMessage);
        }
        else {
          return CircularProgressIndicator();
        }
      },
    );
  }

}