import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBtdixI51PF1a2mZ8Kyx6ZPvr9_735q_bA",
            authDomain: "m-y-tickets-ranimk.firebaseapp.com",
            projectId: "m-y-tickets-ranimk",
            storageBucket: "m-y-tickets-ranimk.appspot.com",
            messagingSenderId: "323552791058",
            appId: "1:323552791058:web:85db5a393400da7da766cb"));
  } else {
    await Firebase.initializeApp();
  }
}
