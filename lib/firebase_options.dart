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
    apiKey: 'AIzaSyBvvEC5fI4MDBahQpXOZTuNXeqxHPLIhhs',
    appId: '1:777968460628:web:3179c76a6876de14485ec1',
    messagingSenderId: '777968460628',
    projectId: 'mydrakorlist-e82bc',
    authDomain: 'mydrakorlist-e82bc.firebaseapp.com',
    storageBucket: 'mydrakorlist-e82bc.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAwira2lE9jOvjgwC7vVhoQeoCUhg4fbPA',
    appId: '1:777968460628:android:3a6cd2e809f64769485ec1',
    messagingSenderId: '777968460628',
    projectId: 'mydrakorlist-e82bc',
    storageBucket: 'mydrakorlist-e82bc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBQ1cKmePmAlUnUCg6hXrP67NHgRtJjbro',
    appId: '1:777968460628:ios:b5976d2f6701b8c8485ec1',
    messagingSenderId: '777968460628',
    projectId: 'mydrakorlist-e82bc',
    storageBucket: 'mydrakorlist-e82bc.appspot.com',
    iosBundleId: 'com.example.mydrakorlist2',
  );
}
