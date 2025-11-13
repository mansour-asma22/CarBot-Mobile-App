import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';

import '../core/constant/routes.dart';

class GoogleSignInController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      // Ajoute d'autres scopes si nécessaire
    ],
  );

  // Pour stocker l'utilisateur connecté
  var googleAccount = Rxn<GoogleSignInAccount>();

  // Méthode pour initier la connexion
  Future<void> signInWithGoogle() async {
    print("DEBUG: signInWithGoogle() called");
    try {
      await _googleSignIn.signOut();
      final account = await _googleSignIn.signIn();
      googleAccount.value = account;
      if (account != null) {
        print("Connecté avec Google : ${account.displayName} - ${account.email}");
        // Tu peux naviguer vers la page d'accueil ou effectuer d'autres actions
         Get.offAllNamed(AppRoute.homescreen);
      } else {
        print("La connexion Google a été annulée par l'utilisateur.");
      }
    } catch (error) {
      print("Erreur lors de la connexion Google : $error");
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    googleAccount.value = null;
  }
}
