import 'package:dartz/dartz.dart';
import 'package:graduation_project/domain/entities/CategoryResponseEntity.dart';
import 'package:graduation_project/domain/entities/faliures.dart';

abstract class HomeRepositoryContract{
  Future<Either<Faliures,CategoryResponseEntity>> getAllCategories();
}