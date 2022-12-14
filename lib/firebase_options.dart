// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBQ-Zs6Ik9gdHJc3WomOH2PzhZ6yP14nr0',
    appId: '1:73471013962:web:e63700a6573cfc309ca2b3',
    messagingSenderId: '73471013962',
    projectId: 'shop-app-38838',
    authDomain: 'shop-app-38838.firebaseapp.com',
    storageBucket: 'shop-app-38838.appspot.com',
    measurementId: 'G-FPGFJ49L9K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBmU-I4DTYq-75itWPD5QlyhpjUlPtPRQg',
    appId: '1:73471013962:android:3702787c55e379459ca2b3',
    messagingSenderId: '73471013962',
    projectId: 'shop-app-38838',
    storageBucket: 'shop-app-38838.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDp98Iw95W6jTWxkY9qR0HA2BOHNE3Tdwk',
    appId: '1:73471013962:ios:cd5a6e5b587c24909ca2b3',
    messagingSenderId: '73471013962',
    projectId: 'shop-app-38838',
    storageBucket: 'shop-app-38838.appspot.com',
    iosClientId: '73471013962-4c6q213ddevhmvv8n8s65a2l769q37rp.apps.googleusercontent.com',
    iosBundleId: 'com.example.multiVendorShopApp',
  );
}
