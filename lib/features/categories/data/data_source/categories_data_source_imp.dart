import 'package:dartz/dartz.dart';
import 'package:mm_2/core/errors/failure.dart';
import 'package:mm_2/core/network/api_consumer.dart';
import 'package:mm_2/core/network/api_constants.dart';
import 'categories_data_source.dart';

class CategoryDataSourceImpl implements CategoriesDataSource {
  final ApiConsumer _apiConsumer;

  CategoryDataSourceImpl(this._apiConsumer);

  @override
  Future<Either<Failure, Map<String, dynamic>>> getcategories() async {
    final response = await _apiConsumer.get(
      path: ApiConstants.categories,
    );

    return response;
  }
}