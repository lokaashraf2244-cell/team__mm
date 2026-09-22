import 'package:dartz/dartz.dart';
import 'package:mm_2/core/errors/failure.dart';
import 'package:mm_2/core/network/api_consumer.dart';
import 'package:mm_2/core/network/api_constants.dart';

import 'categories_data_source.dart';

class CategoryDataSourceImpl implements CategoriesDataSource {
  final ApiConsumer apiConsumer;

  CategoryDataSourceImpl(this.apiConsumer);

  static const String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyNTMyZGJlOS1iMGY2LTRjZTAtM2RkMC0wOGRmMTVkY2QxMGQiLCJqdGkiOiJkZTI5YTFjZi00OTViLTQ5NGItODkzOC1lZGQ0OTU5NjJlMDQiLCJlbWFpbCI6Imxva2EuYXNocmFmMjI0NEBnbWFpbC5jb20iLCJuYW1lIjoibG9rYSBhc2hyYWYiLCJyb2xlcyI6IiIsInBpY3R1cmUiOiIiLCJleHAiOjE3OTAyNDc5MjMsImlzcyI6ImVzaG9wLm5ldCIsImF1ZCI6ImVzaG9wLm5ldCJ9.qWgP9smtZUVgcmMLcMuyE59w0wOq6_qPWxMLt-qnOck";

  @override
  Future<Either<Failure, Map<String, dynamic>>> getcategories() async {
    print('========== CATEGORIES REQUEST ==========');
    print('PATH: ${ApiConstants.categories}');

    final response = await apiConsumer.get(
      path: ApiConstants.categories,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    print('========== CATEGORIES RESPONSE ==========');
    print(response);
    print('==========================================');

    return response;
  }
}