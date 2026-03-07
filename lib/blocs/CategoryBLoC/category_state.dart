import 'package:equatable/equatable.dart';
import 'package:tracking_app/data/model/brand_model.dart';
import 'package:tracking_app/data/model/category_model.dart';

abstract class CategoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<CategoryModel> categories;

  CategoryLoaded(this.categories);

  @override
  List<Object?> get props => [categories];
}

class CategoryBrandLoaded extends CategoryState {
  final List<BrandModel> brands;

  CategoryBrandLoaded(this.brands);

  @override
  List<Object?> get props => [brands];
}

class CategoryError extends CategoryState {
  final String message;

  CategoryError(this.message);

  @override
  List<Object?> get props => [message];
}
