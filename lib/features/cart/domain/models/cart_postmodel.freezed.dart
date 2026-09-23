// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_postmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddItemToCartResponse {

 String get message; String? get id; String? get productId; int get quantity;
/// Create a copy of AddItemToCartResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddItemToCartResponseCopyWith<AddItemToCartResponse> get copyWith => _$AddItemToCartResponseCopyWithImpl<AddItemToCartResponse>(this as AddItemToCartResponse, _$identity);

  /// Serializes this AddItemToCartResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AddItemToCartResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddItemToCartResponse&&(identical(other.message, _this.message) || other.message == _this.message)&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.productId, _this.productId) || other.productId == _this.productId)&&(identical(other.quantity, _this.quantity) || other.quantity == _this.quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AddItemToCartResponse;
  return Object.hash(runtimeType,_this.message,_this.id,_this.productId,_this.quantity);
}

@override
String toString() {
  final _this = this as AddItemToCartResponse;
  return 'AddItemToCartResponse(message: ${_this.message}, id: ${_this.id}, productId: ${_this.productId}, quantity: ${_this.quantity})';
}


}

/// @nodoc
abstract mixin class $AddItemToCartResponseCopyWith<$Res>  {
  factory $AddItemToCartResponseCopyWith(AddItemToCartResponse value, $Res Function(AddItemToCartResponse) _then) = _$AddItemToCartResponseCopyWithImpl;
@useResult
$Res call({
 String message, String? id, String? productId, int quantity
});




}
/// @nodoc
class _$AddItemToCartResponseCopyWithImpl<$Res>
    implements $AddItemToCartResponseCopyWith<$Res> {
  _$AddItemToCartResponseCopyWithImpl(this._self, this._then);

  final AddItemToCartResponse _self;
  final $Res Function(AddItemToCartResponse) _then;

/// Create a copy of AddItemToCartResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? id = freezed,Object? productId = freezed,Object? quantity = null,}) {
  return _then(AddItemToCartResponse(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AddItemToCartResponse].
extension AddItemToCartResponsePatterns on AddItemToCartResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddItemToCartResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddItemToCartResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddItemToCartResponse value)  $default,){
final _that = this;
switch (_that) {
case _AddItemToCartResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddItemToCartResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AddItemToCartResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message,  String? id,  String? productId,  int quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddItemToCartResponse() when $default != null:
return $default(_that.message,_that.id,_that.productId,_that.quantity);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message,  String? id,  String? productId,  int quantity)  $default,) {final _that = this;
switch (_that) {
case _AddItemToCartResponse():
return $default(_that.message,_that.id,_that.productId,_that.quantity);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message,  String? id,  String? productId,  int quantity)?  $default,) {final _that = this;
switch (_that) {
case _AddItemToCartResponse() when $default != null:
return $default(_that.message,_that.id,_that.productId,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddItemToCartResponse implements AddItemToCartResponse {
  const _AddItemToCartResponse({required this.message, this.id, this.productId, required this.quantity});
  factory _AddItemToCartResponse.fromJson(Map<String, dynamic> json) => _$AddItemToCartResponseFromJson(json);

@override final  String message;
@override final  String? id;
@override final  String? productId;
@override final  int quantity;

/// Create a copy of AddItemToCartResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddItemToCartResponseCopyWith<_AddItemToCartResponse> get copyWith => __$AddItemToCartResponseCopyWithImpl<_AddItemToCartResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddItemToCartResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddItemToCartResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,message,id,productId,quantity);
}

@override
String toString() {
    return 'AddItemToCartResponse(message: $message, id: $id, productId: $productId, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$AddItemToCartResponseCopyWith<$Res> implements $AddItemToCartResponseCopyWith<$Res> {
  factory _$AddItemToCartResponseCopyWith(_AddItemToCartResponse value, $Res Function(_AddItemToCartResponse) _then) = __$AddItemToCartResponseCopyWithImpl;
@override @useResult
$Res call({
 String message, String? id, String? productId, int quantity
});




}
/// @nodoc
class __$AddItemToCartResponseCopyWithImpl<$Res>
    implements _$AddItemToCartResponseCopyWith<$Res> {
  __$AddItemToCartResponseCopyWithImpl(this._self, this._then);

  final _AddItemToCartResponse _self;
  final $Res Function(_AddItemToCartResponse) _then;

/// Create a copy of AddItemToCartResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? id = freezed,Object? productId = freezed,Object? quantity = null,}) {
  return _then(_AddItemToCartResponse(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
