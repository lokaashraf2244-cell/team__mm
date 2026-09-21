import 'package:dartz/dartz.dart';
import 'package:mm_2/core/errors/failure.dart';
import 'package:mm_2/features/categories/data/data_source/categories_data_source.dart';
import 'package:mm_2/features/categories/domain/models/categories_model.dart';
import 'package:mm_2/features/categories/domain/reposatories/categories_repo.dart';

class CategoriesRepoImpl implements Categoriesrepo {
  final CategoriesDataSource categoriesDataSource;

  CategoriesRepoImpl({
    required this.categoriesDataSource,
  });

  @override
  Future<Either<Failure, CategoriesResponse>> getcategories() async {
    final response = await categoriesDataSource.getcategories();

    return response.fold(
          (failure) => Left(failure),
          (data) {
        try {
          final categoriesResponse =
          CategoriesResponse.fromJson(data);

          return Right(categoriesResponse);
        } catch (e) {
          return Left(
            DataMappingFailure(msg: e.toString()),
          );
        }
      },
    );
  }
}