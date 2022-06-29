import 'package:algoriza_quizz_1/core/utils/asset_manger.dart';
import 'package:algoriza_quizz_1/core/utils/color_manger.dart';
import 'package:algoriza_quizz_1/features/auth/presentation/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../config/routes/magic_router.dart';
import '../../../../config/theme/theme_manger.dart';
import '../widgets/comp.dart';
import 'login.dart';

class BoardingModel {
  final String title;
  final String description;
  final String image;

  BoardingModel(this.title, this.description, this.image);
}

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController pageViewController = PageController();
  int pageViewCurrentIndex = 0;

  String onBoardingButtonText = 'Next';

  final List<BoardingModel> boardingModels = [
    BoardingModel(
      'Get food delivery to your doorstep asap',
      'We have young and professional delivery team that will bring your food as soon as possible to your doorstep',
      AssetsManger.onBoarding_1,
    ),
    BoardingModel(
      'Buy any food from your favorite restaurant',
      'We are constantly adding your favorite restaurant throughout the territory and around your area carefully selected',
      AssetsManger.onBoarding_2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    MagicRouter.navigateAndPopAll(const SignUpView());
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(ColorManger.skipButtonColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    splashFactory: NoSplash.splashFactory,
                  ),
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      foreground: Paint()..color = ColorManger.blackColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                height: 50,
                child: Image.asset(
                  AssetsManger.logo,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .6,
                child: PageView.builder(
                  controller: pageViewController,
                  itemCount: 2,
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (int index) {
                    pageViewCurrentIndex = index;
                    if (index == boardingModels.length - 1) {
                      onBoardingButtonText = 'Login';
                    } else {
                      onBoardingButtonText = 'Next';
                    }
                    setState(() {});
                  },
                  itemBuilder: (context, index) {
                    return OnBoardingScreenItem(
                      boardingModel: boardingModels[index],
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: SmoothPageIndicator(
                  controller: pageViewController,
                  count: 2,
                  effect: const WormEffect(
                    dotHeight: 5,
                    dotWidth: 20,
                    activeDotColor: Colors.orangeAccent,
                    // strokeWidth: 5,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextButton(
                text: onBoardingButtonText,
                onPressed: () {
                  if (pageViewCurrentIndex == boardingModels.length - 1) {
                    MagicRouter.navigateAndPopAll(const SignInView());
                  } else {
                    pageViewController.animateToPage(
                      1,
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastOutSlowIn,
                    );
                  }
                },
                padding: 18,
                radius: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? ',
                    style: StyleManger.regularTextStyle,
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      MagicRouter.navigateAndPopAll(const SignUpView());
                    },
                    child: Text(
                      'Sign Up',
                      style: StyleManger.regularTextStyle
                          .copyWith(color: Colors.teal),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
