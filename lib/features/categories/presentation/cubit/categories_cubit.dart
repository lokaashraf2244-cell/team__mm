import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mm_2/features/categories/domain/reposatories/categories_repo.dart';
import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final Categoriesrepo categoriesRepo;

  CategoriesCubit({
    required this.categoriesRepo,
  }) : super(CategoriesInitialState());

  Future<void> getCategories() async {
    emit(CategoriesLoadingState());

    final result = await categoriesRepo.getcategories();

    result.fold(
          (failure) {
        emit(CategoriesFailureState(failure.msg));
      },
          (categories) {
        emit(CategoriesSuccessState(categories));
      },
    );
  }
}