import 'package:e_food/theme/images.dart';
import 'package:e_food/theme/colors.dart';
import 'package:e_food/util/authentication.dart';
import 'package:e_food/widgets/google_sign_in_button.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AppImages.logo,
                    width: 40,
                  ),
                  const SizedBox(height: 50),
                  const Row(
                    children: [
                      Text(
                        'GET ',
                        style: TextStyle(
                          fontSize: 36,
                        ),
                      ),
                      Text(
                        'STARTED',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 36,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Get started and enjoy the awesome local food right at your home.',
                    key: Key('welcome_login'),
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: AppColors.primary,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FutureBuilder(
                    future: Authentication.initializeFirebase(context),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Error initializing Firebase');
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        return const GoogleSignInButton();
                      }
                      return const CircularProgressIndicator(
                        color: AppColors.white,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
