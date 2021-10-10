import 'package:scan_mo/core/exports.dart';

import 'package:scan_mo/ui/widgets/get_started_button.dart';
import 'package:scan_mo/ui/widgets/custom_page_indicator.dart';

import 'package:scan_mo/core/view_models/onboarding_view_model.dart';

class OnboardingView extends StatelessWidget {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.only(
                top: 50.h, right: 24.w, left: 24.w, bottom: 30.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Opacity(
                        opacity: model.pageIndex != 2 ? 1 : 0,
                        child: CustomText(
                          "Skip",
                          color: AppColors.primary,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    onTap: () {
                      _pageController.animateToPage(2,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.bounceIn);
                    },
                  ),
                ),
                Expanded(
                  child: PageView(
                    onPageChanged: model.changePage,
                    controller: _pageController,
                    children: [
                      OnboardingViewOne(),
                      OnboardingViewTwo(),
                      OnboardingViewThree()
                    ],
                  ),
                ),
                model.pageIndex != 2
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomPageIndicator(
                            currentIndex: model.pageIndex,
                            noOfPages: 3,
                          ),
                          SizedBox(
                            height: 45.r,
                            width: 45.r,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  primary: AppColors.secondary,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              onPressed: () {
                                _pageController.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.decelerate);
                              },
                              child: SvgPicture.asset(
                                "assets/images/right_arrow.svg",
                                width: 30.w,
                                height: 18.h,
                              ),
                            ),
                          ),
                        ],
                      )
                    : GetStartedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SIGN_UP_ROUTE);
                        },
                      ),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => locator<OnboardingViewModel>(),
    );
  }
}

class OnboardingViewOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/onboarding_handshake.png",
            height: 302.r, width: 302.r),
        SizedBox(height: 51.h),
        CustomText(
          "Share your contacts faster than you can say \"Idiosyncratic\".",
          fontSize: 18,
          textAlign: TextAlign.center,
          color: AppColors.primary,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(height: 22.h),
        CustomText(
          "We're offering you the ability to share contacts faster and more conveniently.",
          textAlign: TextAlign.center,
          fontSize: 12.5,
          color: AppColors.primary,
        ),
      ],
    );
  }
}

class OnboardingViewTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/onboarding_phone_user.png",
            height: 302.r + 51.h, width: 302.r),
        CustomText(
          "Don't be held up on the inconsistencies sharing a contact",
          fontSize: 18,
          textAlign: TextAlign.center,
          color: AppColors.primary,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(height: 14.h),
        CustomText(
          "Inconsistent methods should be a thing of the past",
          textAlign: TextAlign.center,
          fontSize: 12.5,
          color: AppColors.primary,
        ),
      ],
    );
  }
}

class OnboardingViewThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/onboarding_multitasking.png",
            height: 302.r, width: 302.r),
        SizedBox(height: 51.h),
        CustomText(
          " The power of peer to peer sharing is now in your hands ",
          fontSize: 18,
          textAlign: TextAlign.center,
          color: AppColors.primary,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(height: 11.h),
        CustomText(
          "With great power comes great responsibility",
          textAlign: TextAlign.center,
          fontSize: 12.5,
          color: AppColors.primary,
        ),
      ],
    );
  }
}
