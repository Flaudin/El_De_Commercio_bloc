import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchProductsByPopular extends ProductEvent {}

class FetchProductsByBrand extends ProductEvent {
  final int brandId;

  FetchProductsByBrand(this.brandId);
}

class RefreshProducts extends ProductEvent {}

class SearchProduct extends ProductEvent {
  final String query;

  SearchProduct(this.query);

  @override
  List<Object?> get props => [query];
}
