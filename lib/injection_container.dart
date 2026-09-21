import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:mm_2/core/network/api_consumer.dart';
import 'package:mm_2/core/network/dio_consumer.dart';
import 'package:mm_2/core/network/dio_factory.dart';

import 'package:mm_2/features/products/data/data_source/product_remote_data_source.dart';
import 'package:mm_2/features/products/data/data_source/product_remote_data_source_impl.dart';
import 'package:mm_2/features/products/data/repos/product_repository_impl.dart';
import 'package:mm_2/features/products/domain/repositories/product_repository.dart';
import 'package:mm_2/features/products/domain/usecase/get_products.dart';
import 'package:mm_2/features/products/domain/usecase/get_product_details.dart';
import 'package:mm_2/features/products/peresentation/cubit/product_cubit.dart';

import 'package:mm_2/features/categories/data/data_source/categories_data_source.dart';

import 'package:mm_2/features/categories/data/repos/categories_repo_imp.dart';
import 'package:mm_2/features/categories/domain/reposatories/categories_repo.dart';
import 'package:mm_2/features/categories/presentation/cubit/categories_cubit.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  getIt.registerLazySingleton<Dio>(
        () => DioFactory.create(),
  );

  getIt.registerLazySingleton<ApiConsumer>(
        () => DioConsumer(
      getIt<Dio>(),
    ),
  );

  getIt.registerLazySingleton<ProductDataSource>(
        () => ProductDataSourceImpl(
      getIt<ApiConsumer>(),
    ),
  );

  getIt.registerLazySingleton<ProductRepository>(
        () => ProductRepositoryImpl(
      getIt<ProductDataSource>(),
    ),
  );

  getIt.registerLazySingleton<GetProducts>(
        () => GetProducts(
      getIt<ProductRepository>(),
    ),
  );

  getIt.registerLazySingleton<GetProductDetails>(
        () => GetProductDetails(
      getIt<ProductRepository>(),
    ),
  );

  getIt.registerFactory<ProductCubit>(
        () => ProductCubit(
      getIt<GetProducts>(),
      getIt<GetProductDetails>(),
    ),
  );

  getIt.registerLazySingleton<Categoriesrepo>(
        () => CategoriesRepoImpl(
      categoriesDataSource: getIt<CategoriesDataSource>(),
    ),
  );

  getIt.registerFactory<CategoriesCubit>(
        () => CategoriesCubit(
      categoriesRepo: getIt<Categoriesrepo>(),
    ),
  );
}