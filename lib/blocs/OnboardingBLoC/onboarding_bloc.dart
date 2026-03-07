import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/blocs/OnboardingBLoC/onboarding_event.dart';
import 'package:tracking_app/blocs/OnboardingBLoC/onboarding_state.dart';
import 'package:tracking_app/components/utils/preference_manager.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingState()) {
    on<PageChangeEvent>(onpageChange);
    on<OnboardingCompletedEvent>(onBoardingComplete);
  }

  void onpageChange(PageChangeEvent event, Emitter<OnboardingState> emit) {
    final isLastPage = event.pageIndex == 2;
    emit(state.copyWith(currentPage: event.pageIndex, isLastPage: isLastPage));
  }

  void onBoardingComplete(
    OnboardingCompletedEvent event,
    Emitter<OnboardingState> emit,
  ) async {
    final prefsManager = PreferencesManager();
    await prefsManager.setOnboardingCompleted();
    emit(state.copyWith(onboardingCompleted: true));
  }
}
