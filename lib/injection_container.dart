import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mm_2/features/auth/data/external/interceptor.dart';
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
import 'package:mm_2/features/categories/data/data_source/categories_data_source_imp.dart';
import 'package:mm_2/features/categories/data/repos/categories_repo_imp.dart';
import 'package:mm_2/features/categories/domain/reposatories/categories_repo.dart';
import 'package:mm_2/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:mm_2/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:mm_2/features/auth/data/data_source/auth_remote_data_source_imp.dart';
import 'package:mm_2/features/auth/data/repos/auth_repo_imp.dart';
import 'package:mm_2/features/auth/domain/reposatories/auth_repo.dart';
import 'package:mm_2/features/auth/domain/usecase/login.dart';
import 'package:mm_2/features/auth/domain/usecase/signup.dart';
import 'package:mm_2/features/auth/domain/usecase/verify_email.dart';
import 'package:mm_2/features/auth/domain/usecase/resend_otp.dart';
import 'package:mm_2/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/local_storage/base_local_storage.dart';
import 'features/auth/data/local_storage/shared_pref_impl.dart';
import 'features/cart/data/data_source/cart_data_source.dart';
import 'features/cart/data/data_source/cart_data_source_imp.dart';
import 'features/cart/data/repos/cart_repo_imp.dart';
import 'features/cart/domain/repos/cart_repo.dart';
import 'features/cart/presentation/cubit/cart_cubit.dart';
final getIt = GetIt.instance;

Future<void> initDependencies() async {
  final sharedPreferences =
  await SharedPreferences.getInstance();

  getIt.registerLazySingleton<BaseLocalStorage>(
        () => SharedPrefsLocalStorageImpl(
      preferences: sharedPreferences,
    ),
  );
  getIt.registerLazySingleton<Dio>(
        () => DioFactory.create(localStorage: getIt<BaseLocalStorage>(),),
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

  getIt.registerLazySingleton<CategoriesDataSource>(
        () => CategoryDataSourceImpl(
      getIt<ApiConsumer>(),
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

  getIt.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthDataSourceImpl(
      getIt<ApiConsumer>(),
    ),
  );

  getIt.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(
      remoteDataSource: getIt<AuthRemoteDataSource>(),
    ),
  );

  getIt.registerLazySingleton<Login>(
        () => Login(
      getIt<AuthRepository>(),
    ),
  );

  getIt.registerLazySingleton<SignUp>(
        () => SignUp(
      getIt<AuthRepository>(),
    ),
  );

  getIt.registerLazySingleton<VerifyEmail>(
        () => VerifyEmail(
      getIt<AuthRepository>(),
    ),
  );

  getIt.registerLazySingleton<ResendOtp>(
        () => ResendOtp(
      getIt<AuthRepository>(),
    ),
  );

  getIt.registerFactory<AuthCubit>(
        () => AuthCubit(
      loginUseCase: getIt<Login>(),
      signUpUseCase: getIt<SignUp>(),
      verifyEmailUseCase: getIt<VerifyEmail>(),
      resendOtpUseCase: getIt<ResendOtp>(),
          localStorage: getIt<BaseLocalStorage>(),
    ),
  );

  getIt.registerLazySingleton<CartDataSource>(
        () => CartDataSourceImpl(
      getIt<ApiConsumer>(),
    ),
  );

  getIt.registerLazySingleton<CartRepo>(
        () => CartRepoImpl(
      cartDataSource: getIt<CartDataSource>(),
    ),
  );

  getIt.registerFactory<CartCubit>(
        () => CartCubit(
      cartRepo: getIt<CartRepo>(),
    ),
  );
}