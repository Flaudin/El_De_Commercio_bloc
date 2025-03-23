import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/blocs/UserBLoC/user_event.dart';
import 'package:tracking_app/blocs/UserBLoC/user_state.dart';
import 'package:tracking_app/data/repositories/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(UserInitial()) {
    on<FetchUserEvent>(onGetUser);
    on<FetchPaymentMethodsEvent>(onGetPaymentMethods);
  }

  Future<void> onGetUser(FetchUserEvent event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final user = await userRepository.getCurrentUser();
      emit(UserLoaded(user: user));
    } catch (e) {
      emit(UserError(message: 'Error fetching user: $e'));
    }
  }

  Future<void> onGetPaymentMethods(
    FetchPaymentMethodsEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());
    try {
      final paymentMethods = await userRepository.getPaymentMethods();
      emit(PaymentMethodsLoaded(paymentMethods: paymentMethods));
    } catch (e) {
      emit(UserError(message: 'Error fetching payment methods : $e'));
    }
  }
}
