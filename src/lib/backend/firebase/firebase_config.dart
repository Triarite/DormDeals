import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB1wdP6nJJnQQuKgB4p56fGFwuB3JqeUtM",
            authDomain: "college-marketplace-r07p1e.firebaseapp.com",
            projectId: "college-marketplace-r07p1e",
            storageBucket: "college-marketplace-r07p1e.firebasestorage.app",
            messagingSenderId: "195311409261",
            appId: "1:195311409261:web:4900a38729f547f8db8764",
            measurementId: "G-NH804ESHNV"));
  } else {
    await Firebase.initializeApp();
  }
}
