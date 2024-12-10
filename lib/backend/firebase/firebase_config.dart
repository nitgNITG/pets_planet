import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCyLfFImjIIMfiWpyGFFH8BLTfGm5020Qw",
            authDomain: "pets-453fc.firebaseapp.com",
            projectId: "pets-453fc",
            storageBucket: "pets-453fc.firebasestorage.app",
            messagingSenderId: "39438308608",
            appId: "1:39438308608:web:0814d4f8467f233228cfe5",
            measurementId: "G-8Q3D60HMQW"));
  } else {
    await Firebase.initializeApp();
  }
}
