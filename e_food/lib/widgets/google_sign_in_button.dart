import 'package:e_food/screens/home.dart';
import 'package:e_food/theme/images.dart';
import 'package:e_food/theme/colors.dart';
import 'package:e_food/util/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GoogleSignInButton extends StatefulWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  State<GoogleSignInButton> createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return _isSigningIn
        ? const CircularProgressIndicator(color: AppColors.white)
        : OutlinedButton(
            key: const Key('google_button'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.white),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
            onPressed: () async {
              setState(() {
                _isSigningIn = true;
              });

              User? user =
                  await Authentication.signInWithGoogle(context: context);

              setState(() {
                _isSigningIn = false;
              });

              if ((user != null) && (context.mounted)) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const Home(),
                  ),
                );
              }
            },
            child: const Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage(AppImages.google),
                    height: 35.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Login com Google',
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.gray,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
