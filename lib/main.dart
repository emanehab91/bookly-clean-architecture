
import 'package:bookly/Features/home/data/data%20sources/home_local_data_source.dart';
import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/Features/home/presentation/managers/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/simple_bloc_observer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'Features/Splash/presentation/views/splash_view.dart';
import 'Features/home/data/data sources/home_remote_data_source.dart';
import 'Features/home/domain/entities/book_entity.dart';
import 'Features/home/domain/use _cases/fetch_featured_books_use_case.dart';
import 'Features/home/domain/use _cases/fetch_newest_books_use_case.dart';
import 'Features/home/presentation/managers/newest_books_cubit/newest_books_cubit.dart';
import 'core/utils/functions/set_up_service_locator.dart';

void main() async {
  await Hive.initFlutter();
  setUpServiceLocator();


  Hive.registerAdapter(BookEntityAdapter());

  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  Bloc.observer=SimpleBlocObserver();

  runApp(const Bookly());

}


class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context){

        return FeaturedBooksCubit(FetchFeaturedBooksUseCase(

          getIt.get<HomeRepoImpl>(),
        ),
        )..fetchFeaturedBooks();
      },
      ),

        BlocProvider(create: (context){

          return NewestBooksCubit(FetchNewestBooksUseCase(
            getIt.get<HomeRepoImpl>(),

          ),
          );
        },
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
