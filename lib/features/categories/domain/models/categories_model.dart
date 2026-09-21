import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_model.freezed.dart';
part 'categories_model.g.dart';

@freezed
abstract class CategoriesResponse with _$CategoriesResponse {
  const factory CategoriesResponse({@Default([]) List<Category> categories}) =
  _CategoriesResponse;

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseFromJson(json);
}

@freezed
abstract class Category with _$Category {
  const factory Category({
    required String id,
    required String name,
    required String description,
    required String coverPictureUrl,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}