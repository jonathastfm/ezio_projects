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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDuIyrB65aMvOxLWtvIlreespwn2D-_2qU',
    appId: '1:479034130486:web:91e67e31c89b473ebad897',
    messagingSenderId: '479034130486',
    projectId: 'rpjas-mobile',
    authDomain: 'rpjas-mobile.firebaseapp.com',
    storageBucket: 'rpjas-mobile.appspot.com',
    measurementId: 'G-N4PXP4YGVE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDYBInRn4YepYp-00Ou9Vig9lIxRl0lbi0',
    appId: '1:479034130486:android:345c8f2e2aee359ebad897',
    messagingSenderId: '479034130486',
    projectId: 'rpjas-mobile',
    storageBucket: 'rpjas-mobile.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCLo6sRkSP6Gotg_kyZD1IgfqyOZ2q2H7U',
    appId: '1:479034130486:ios:60ea997c056b37c7bad897',
    messagingSenderId: '479034130486',
    projectId: 'rpjas-mobile',
    storageBucket: 'rpjas-mobile.appspot.com',
    iosBundleId: 'com.example.comEzioOsrpjas',
  );
}
