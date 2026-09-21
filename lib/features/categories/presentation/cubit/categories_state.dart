import 'package:mm_2/features/categories/domain/models/categories_model.dart';

abstract class CategoriesState {}

class CategoriesInitialState extends CategoriesState {}

class CategoriesLoadingState extends CategoriesState {}

class CategoriesSuccessState extends CategoriesState {
  final CategoriesResponse categories;

  CategoriesSuccessState(this.categories);
}

class CategoriesFailureState extends CategoriesState {
  final String message;

  CategoriesFailureState(this.message);
}