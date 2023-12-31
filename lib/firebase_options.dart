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
    apiKey: 'AIzaSyBL5trcJdTWnTqb_wN_ipA2EJrxnyh3Fkg',
    appId: '1:573459885202:web:845ee557b2e59efbff0a4b',
    messagingSenderId: '573459885202',
    projectId: 'cocycle-backend',
    authDomain: 'cocycle-backend.firebaseapp.com',
    storageBucket: 'cocycle-backend.appspot.com',
    measurementId: 'G-73B4DREMXF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCm1tErypxf5JjhLEBBhuhaWfoxjVT3GAk',
    appId: '1:573459885202:android:a8ff5082c587beddff0a4b',
    messagingSenderId: '573459885202',
    projectId: 'cocycle-backend',
    storageBucket: 'cocycle-backend.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD7_gDAs44vY3ERHr6WTKn3rfLk1G5RLx4',
    appId: '1:573459885202:ios:c5c3108bd6798c48ff0a4b',
    messagingSenderId: '573459885202',
    projectId: 'cocycle-backend',
    storageBucket: 'cocycle-backend.appspot.com',
    iosBundleId: 'com.example.cyclone',
  );
}
