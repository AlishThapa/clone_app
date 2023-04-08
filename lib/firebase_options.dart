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
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyArgu6z4mp26Wu4aLtlE3UTOyaQnjf8BbY',
    appId: '1:1044214889265:web:8f36e596d89b3266ea0e10',
    messagingSenderId: '1044214889265',
    projectId: 'uber-clone-4db04',
    authDomain: 'uber-clone-4db04.firebaseapp.com',
    storageBucket: 'uber-clone-4db04.appspot.com',
    measurementId: 'G-0RVZY0QFBM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAJ8TvYXZpx3EiR1g8_ldzvkzwkluKvz9Q',
    appId: '1:1044214889265:android:211b7ea97e3c3afcea0e10',
    messagingSenderId: '1044214889265',
    projectId: 'uber-clone-4db04',
    storageBucket: 'uber-clone-4db04.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCvTn6tKT3N1kXCEKGxcyJM92b2oOWJyyI',
    appId: '1:1044214889265:ios:0da39ee39545faebea0e10',
    messagingSenderId: '1044214889265',
    projectId: 'uber-clone-4db04',
    storageBucket: 'uber-clone-4db04.appspot.com',
    iosClientId: '1044214889265-1bp008htgjc71fjfopbtrhr2ervifbih.apps.googleusercontent.com',
    iosBundleId: 'com.example.uberClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCvTn6tKT3N1kXCEKGxcyJM92b2oOWJyyI',
    appId: '1:1044214889265:ios:0da39ee39545faebea0e10',
    messagingSenderId: '1044214889265',
    projectId: 'uber-clone-4db04',
    storageBucket: 'uber-clone-4db04.appspot.com',
    iosClientId: '1044214889265-1bp008htgjc71fjfopbtrhr2ervifbih.apps.googleusercontent.com',
    iosBundleId: 'com.example.uberClone',
  );
}