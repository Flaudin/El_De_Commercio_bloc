import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tracking_app/blocs/OnboardingBLoC/onboarding_bloc.dart';
import 'package:tracking_app/blocs/OnboardingBLoC/onboarding_event.dart';
import 'package:tracking_app/blocs/OnboardingBLoC/onboarding_state.dart';
import 'package:tracking_app/data/model/onboarding_model.dart';
import 'package:tracking_app/presentation/screens/onboarding/components/onboarding_page.dart';
import 'package:tracking_app/utils/constants.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController pageController = PageController();
  final List<OnboardingModel> contents = [
    OnboardingModel(
      image: 'android/assets/lottie/ani1.json',
      title: 'Seamless Shopping Experience',
      description:
          'An amazing experience awaits you. Discover how we can help you achieve your goals.',
    ),
    OnboardingModel(
      image: 'assets/images/onboarding2.png',
      title: 'Wishlist to Dream Product in Just a Few Clicks',
      description:
          'Our app provides powerful tools to enhance your productivity and simplify your life.',
    ),
    OnboardingModel(
      image: 'assets/images/onboarding3.png',
      title: 'Swift and Reliable Delivery',
      description:
          'Join our community today and discover the full potential of our application.',
    ),
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingBloc, OnboardingState>(
      listener: (context, state) {
        if (state.onboardingCompleted) {
          context.go('/login');
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              PageView.builder(
                controller: pageController,
                itemCount: contents.length,
                onPageChanged: (index) {
                  context.read<OnboardingBloc>().add(PageChangeEvent(index));
                },
                itemBuilder: (context, index) {
                  return OnboardingPage(content: contents[index]);
                },
              ),
              Positioned(
                bottom: 60,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        contents.length,
                        (index) => buildDot(index, state.currentPage),
                      ),
                    ),
                    SizedBox(height: 20),
                    buildProgressButton(context, state),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildDot(int index, int currentPage) {
    return Container(
      height: 10,
      width: 10,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: currentPage == index ? kPrimaryColor : Colors.grey,
      ),
    );
  }

  Widget buildProgressButton(BuildContext context, OnboardingState state) {
    return GestureDetector(
      onTap: () {
        if (state.isLastPage) {
          context.read<OnboardingBloc>().add(OnboardingCompletedEvent());
        } else {
          pageController.nextPage(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        }
      },
      child: Container(
        height: 60.h,
        width: 60.h,
        decoration: BoxDecoration(shape: BoxShape.circle, color: kPrimaryColor),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
              value: (state.currentPage + 1) / contents.length,
              backgroundColor: Colors.white.withOpacity(0.3),
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 3,
            ),
            Icon(
              state.isLastPage ? Icons.check : Icons.arrow_forward,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
