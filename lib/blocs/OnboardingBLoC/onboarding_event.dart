abstract class OnboardingEvent {}

class PageChangeEvent extends OnboardingEvent {
  final int pageIndex;
  PageChangeEvent(this.pageIndex);
}

class OnboardingCompletedEvent extends OnboardingEvent {}
