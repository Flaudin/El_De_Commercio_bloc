import 'package:equatable/equatable.dart';

abstract class BrandEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchBrandsByPopular extends BrandEvent {}

class FetchBrandsByCategory extends BrandEvent {}

class RefreshBrands extends BrandEvent {}

class SearchBrands extends BrandEvent {
  final String query;

  SearchBrands(this.query);

  @override
  List<Object?> get props => [query];
}
