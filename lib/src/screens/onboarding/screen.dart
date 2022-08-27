import 'package:enviro_bank_ltd/export.dart';
import 'package:enviro_bank_ltd/src/screens/onboarding/components/illustration_card.dart';
import 'package:enviro_bank_ltd/src/widgets/buttons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    List<String> svgPaths = [
      'assets/svg/onboarding1.svg',
      'assets/svg/onboarding2.svg',
      'assets/svg/onboarding4.svg',
    ];
    List<String> illustrationTitles = [
      'Welcome to Enviro Bank',
      'Quick loans',
      'Automated Banking',
    ];
    List<String> descriptions = [
      'Get acquainted with us and experience seamless bank transactions',
      'Get access to various types of loan and choose your preferred service',
      'Our automated banking ensure quick processing of loans and fast response'
    ];
    return KScaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 70.h, left: 20.w, right: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 300.w,
              height: 310.w,
              child: PageView(
                  controller: pageController,
                  children: List.generate(
                      svgPaths.length,
                      (index) => illustrationCard(
                          svgPath: svgPaths[index],
                          title: illustrationTitles[index],
                          description: descriptions[index]))),
            ),
            pageIndicator(),
            Padding(
              padding: EdgeInsets.only(top: 100.h, bottom: 16.h),
              child: kTextButton(onTap: () {}, title: 'Get Started'),
            ),
            kOutlinedButton(
                onTap: () {
                  context.replace('/login');
                },
                title: 'Login'),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: KText(
                'By using our mobile app, you agree to our Terms of Use and Privacy Policy',
                textAlign: TextAlign.center,
                color: CustomColors.textColorLighterShade,
                fontSize: 12.sp,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget pageIndicator() => Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Center(
          child: SmoothPageIndicator(
              controller: pageController,
              // PageController
              count: 3,
              effect: WormEffect(
                  dotHeight: 5.w,
                  dotWidth: 10.w,
                  activeDotColor: CustomColors.appColor),
              // your preferred effect
              onDotClicked: (index) {}),
        ),
      );
}
