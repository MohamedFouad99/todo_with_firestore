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
    apiKey: 'AIzaSyAFvTyuqMJ3R9jww3HXO1MKosBl3PnbMxQ',
    appId: '1:533987247494:web:d63f517642a7599ae49807',
    messagingSenderId: '533987247494',
    projectId: 'todo-with-firestore',
    authDomain: 'todo-with-firestore.firebaseapp.com',
    storageBucket: 'todo-with-firestore.appspot.com',
    measurementId: 'G-N36MPWRWKH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBity3RxEFVQlW963EvOzJwxpv5Vry9Af4',
    appId: '1:533987247494:android:848c1ce0cc122786e49807',
    messagingSenderId: '533987247494',
    projectId: 'todo-with-firestore',
    storageBucket: 'todo-with-firestore.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB44SXe1S3FKBbs7KJoG5waDamJqOSSEnE',
    appId: '1:533987247494:ios:78833f8ed98d5086e49807',
    messagingSenderId: '533987247494',
    projectId: 'todo-with-firestore',
    storageBucket: 'todo-with-firestore.appspot.com',
    iosClientId: '533987247494-u70jemhsa7r8uofbicvt5fo69svrv68f.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoWithFirestore',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB44SXe1S3FKBbs7KJoG5waDamJqOSSEnE',
    appId: '1:533987247494:ios:78833f8ed98d5086e49807',
    messagingSenderId: '533987247494',
    projectId: 'todo-with-firestore',
    storageBucket: 'todo-with-firestore.appspot.com',
    iosClientId: '533987247494-u70jemhsa7r8uofbicvt5fo69svrv68f.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoWithFirestore',
  );
}
