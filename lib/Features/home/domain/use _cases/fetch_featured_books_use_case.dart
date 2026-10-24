import 'package:dartz/dartz.dart';

import '../../../../core/errors/failur.dart';
import '../../../../core/use cases/use case.dart';
import '../entities/book_entity.dart';
import '../repos/home_repo.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failur, List<BookEntity>>> call([int param=0]) async {
    return await homeRepo.fetchFeaturedBooks(
      // (اليسار): اسم البارامتر الثابت اللي الريبو مستنيه
      // (اليمين): القيمة الفعلية اللي استلمناها من الكيوبيت (عبر الـ call)
      pageNumber: param,
    );
  }
}

