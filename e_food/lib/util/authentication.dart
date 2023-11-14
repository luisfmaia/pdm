import 'package:e_food/entity/app_state.dart';
import 'package:e_food/screens/home.dart';
import 'package:e_food/util/database.dart';
import 'package:e_food/util/messages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class Authentication {
  
  static Future<FirebaseApp> initializeFirebase(BuildContext context) async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if ((user != null) && (context.mounted)) {
      saveUser(context, user);
      
      // Provider.of<AppState>(context, listen: false).setUser(user);
      context.read<AppState>().setUser(user);

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Home(),
        ),
      );
    }

    return firebaseApp;
  }

  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        String message = 'Falha na autenticação';
        if (e.code == 'account-exists-with-different-credential') {
          message = 'Conta já cadastrada.';
        } else if (e.code == 'invalid-credential') {
          message = 'Conta inválida';
        }
        if (context.mounted) {
          Message.showError(context, message);
        }
      } catch (e) {
        if (context.mounted) {
          Message.showError(context, 'Erro na aplicação');
        }
      }
    }

    if ((user != null) && (context.mounted)) {
      saveUser(context, user);
    }
    return user;
  }

  static Future<void> signOut({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      await googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();
      if (!context.mounted) return;
      Message.showMessage(context, 'Sign out feito com sucesso');
    } catch (e) {
      Message.showError(context, 'Erro ao sair');
    }
  }
}
