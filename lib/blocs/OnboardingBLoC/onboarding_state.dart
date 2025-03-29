class OnboardingState {
  final int currentPage;
  final bool isLastPage;
  final bool onboardingCompleted;

  OnboardingState({
    this.currentPage = 0,
    this.isLastPage = false,
    this.onboardingCompleted = false,
  });

  OnboardingState copyWith({
    int? currentPage,
    bool? isLastPage,
    bool? onboardingCompleted,
  }) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      isLastPage: isLastPage ?? this.isLastPage,
      onboardingCompleted: onboardingCompleted ?? this.onboardingCompleted,
    );
  }
}
