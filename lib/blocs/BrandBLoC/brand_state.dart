import 'package:equatable/equatable.dart';
import 'package:tracking_app/data/model/brand_model.dart';

abstract class BrandState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BrandInitial extends BrandState {}

class BrandLoading extends BrandState {}

class BrandLoaded extends BrandState {
  final List<BrandModel> brands;

  BrandLoaded(this.brands);

  @override
  List<Object?> get props => [brands];
}

class BrandError extends BrandState {
  final String message;

  BrandError(this.message);

  @override
  List<Object?> get props => [message];
}
