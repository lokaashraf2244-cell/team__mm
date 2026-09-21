import 'package:dartz/dartz.dart';
import 'package:mm_2/core/errors/failure.dart';
import 'package:mm_2/core/network/api_consumer.dart';
import 'package:mm_2/core/network/api_constants.dart';

import 'categories_data_source.dart';

class CategoryDataSourceImpl implements CategoriesDataSource {
  final ApiConsumer apiConsumer;

  CategoryDataSourceImpl(this.apiConsumer);

  @override
  Future<Either<Failure, Map<String, dynamic>>> getcategories() async {
    print('========== CATEGORIES REQUEST ==========');
    print('PATH: ${ApiConstants.categories}');

    final response = await apiConsumer.get(
      path: ApiConstants.categories,
    );

    print('========== CATEGORIES RESPONSE ==========');
    print(response);
    print('==========================================');

    return response;
  }
}