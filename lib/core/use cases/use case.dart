import 'package:dartz/dartz.dart';

import '../errors/failur.dart';


abstract class UseCase<Type, Param> {
  Future<Either<Failur, Type>> call([Param param]);
}

class NoParam {}