import 'package:e_food/screens/sign_in.dart';
import 'package:e_food/theme/images.dart';
import 'package:e_food/theme/colors.dart';
import 'package:e_food/widgets/button.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final List<String> background = [
    "assets/onboarding1.png",
    "assets/onboarding2.png",
    "assets/onboarding3.png"
  ];

  final List<String> title1 = ['AWESOME', 'DELIVERED AT', 'GRAB THE'];
  final List<String> title2 = [
    'LOCAL FOOD',
    'YOUR DOORSTEP',
    'BEST DEALS AROUND'
  ];
  final List<String> subtitle = [
    'Discover delicious food from the amazing restaurants near you',
    'Fresh and delicious local food delivered from the restaurants to your doorstep',
    'Grab the best deals and discounts around and save on your every order'
  ];
  final List<String> buttonTitle = ['NEXT', 'NEXT', 'GET STARTED'];

  int pos = 0;

  void nextPage() {
    if (pos < background.length - 1) {
      setState(() {
        pos = pos + 1;
      });
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const SignInScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(background[pos]),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AppImages.logoWhite,
                    width: 40,
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title1[pos],
                        key: const Key('title1'),
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 36,
                        ),
                      ),
                      Text(
                        title2[pos],
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 36,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        subtitle[pos],
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 15,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 50),
                      Button(label: buttonTitle[pos], onPressed: nextPage),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
