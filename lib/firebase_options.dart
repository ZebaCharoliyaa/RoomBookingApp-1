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
    apiKey: 'AIzaSyA3Sp9_pEWLIituU6u1lo4kPKkvphv17fI',
    appId: '1:370287773245:web:c9f6ed0a580f8a8fa6cc54',
    messagingSenderId: '370287773245',
    projectId: 'roombooking-5c11f',
    authDomain: 'roombooking-5c11f.firebaseapp.com',
    storageBucket: 'roombooking-5c11f.firebasestorage.app',
    measurementId: 'G-P1LQS7WKL0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCWXeKz3Zd84ckoTnfnSsiGq9aobminySY',
    appId: '1:370287773245:android:17248c39eae8efe6a6cc54',
    messagingSenderId: '370287773245',
    projectId: 'roombooking-5c11f',
    storageBucket: 'roombooking-5c11f.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAPq-0jiE_OmHMpIfFa5RC1QYLLwdJNIE8',
    appId: '1:370287773245:ios:e3c49facfe5186a4a6cc54',
    messagingSenderId: '370287773245',
    projectId: 'roombooking-5c11f',
    storageBucket: 'roombooking-5c11f.firebasestorage.app',
    iosBundleId: 'com.example.roombooking',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAPq-0jiE_OmHMpIfFa5RC1QYLLwdJNIE8',
    appId: '1:370287773245:ios:e3c49facfe5186a4a6cc54',
    messagingSenderId: '370287773245',
    projectId: 'roombooking-5c11f',
    storageBucket: 'roombooking-5c11f.firebasestorage.app',
    iosBundleId: 'com.example.roombooking',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA3Sp9_pEWLIituU6u1lo4kPKkvphv17fI',
    appId: '1:370287773245:web:768eefdecf33d877a6cc54',
    messagingSenderId: '370287773245',
    projectId: 'roombooking-5c11f',
    authDomain: 'roombooking-5c11f.firebaseapp.com',
    storageBucket: 'roombooking-5c11f.firebasestorage.app',
    measurementId: 'G-3HFSFN2Z6J',
  );
}
