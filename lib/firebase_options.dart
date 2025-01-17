// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDNsXxFtrCCfDV6NlI_p1YqlzUZ0uvO9oU',
    appId: '1:597897351847:web:54a96328a32f547eb8c182',
    messagingSenderId: '597897351847',
    projectId: 'foodibeee',
    authDomain: 'foodibeee.firebaseapp.com',
    storageBucket: 'foodibeee.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAv5_sYYWT4o3xHvVAOTlDYhlAALC-TJho',
    appId: '1:597897351847:android:e29c1cb3e7fc0475b8c182',
    messagingSenderId: '597897351847',
    projectId: 'foodibeee',
    storageBucket: 'foodibeee.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDgDMnYep4a8tVM00QktG8eaYKF53PcDjE',
    appId: '1:597897351847:ios:7aa6007427d5f914b8c182',
    messagingSenderId: '597897351847',
    projectId: 'foodibeee',
    storageBucket: 'foodibeee.appspot.com',
    iosBundleId: 'com.example.postapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDgDMnYep4a8tVM00QktG8eaYKF53PcDjE',
    appId: '1:597897351847:ios:7aa6007427d5f914b8c182',
    messagingSenderId: '597897351847',
    projectId: 'foodibeee',
    storageBucket: 'foodibeee.appspot.com',
    iosBundleId: 'com.example.postapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDNsXxFtrCCfDV6NlI_p1YqlzUZ0uvO9oU',
    appId: '1:597897351847:web:1c6f65f10c962dd0b8c182',
    messagingSenderId: '597897351847',
    projectId: 'foodibeee',
    authDomain: 'foodibeee.firebaseapp.com',
    storageBucket: 'foodibeee.appspot.com',
  );
}
