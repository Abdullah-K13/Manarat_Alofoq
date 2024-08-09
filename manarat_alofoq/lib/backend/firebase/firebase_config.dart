import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDMoLBHDz-UnJoD5Xy3t8y5gWoIewBIb3I",
            authDomain: "manarat-app-ym8lwm.firebaseapp.com",
            projectId: "manarat-app-ym8lwm",
            storageBucket: "manarat-app-ym8lwm.appspot.com",
            messagingSenderId: "2553924622",
            appId: "1:2553924622:web:30dbe0944eec5a89e1005f"));
  } else {
    await Firebase.initializeApp();
  }
}
