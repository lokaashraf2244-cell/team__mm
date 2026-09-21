import 'package:dartz/dartz.dart';
import 'package:mm_2/core/errors/failure.dart';
import 'package:mm_2/features/categories/domain/models/categories_model.dart';

abstract class Categoriesrepo {
  Future<Either<Failure, CategoriesResponse>> getcategories();
}