import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchUserEvent extends UserEvent {}

class FetchPaymentMethodsEvent extends UserEvent {}
