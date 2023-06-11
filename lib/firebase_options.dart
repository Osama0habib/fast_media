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
    apiKey: 'AIzaSyATjqhVHv-wa136T_sKWf9bWQr0FsIeRAg',
    appId: '1:244146529376:web:0c3f1820f20929e0d48f05',
    messagingSenderId: '244146529376',
    projectId: 'fast-media-d46c3',
    authDomain: 'fast-media-d46c3.firebaseapp.com',
    storageBucket: 'fast-media-d46c3.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDsKHmz-EkfLGeU4MjE9yTEOAhGfskan8U',
    appId: '1:244146529376:android:5c2bf8bd633435b7d48f05',
    messagingSenderId: '244146529376',
    projectId: 'fast-media-d46c3',
    storageBucket: 'fast-media-d46c3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBeNPm1QB_Hequ2roqza1HbREa-VB3WkSU',
    appId: '1:244146529376:ios:111ab6c9d924657cd48f05',
    messagingSenderId: '244146529376',
    projectId: 'fast-media-d46c3',
    storageBucket: 'fast-media-d46c3.appspot.com',
    iosClientId: '244146529376-4j0el5sp55hjuiqr31e29p85vpraq4s7.apps.googleusercontent.com',
    iosBundleId: 'com.example.fastMedia',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBeNPm1QB_Hequ2roqza1HbREa-VB3WkSU',
    appId: '1:244146529376:ios:111ab6c9d924657cd48f05',
    messagingSenderId: '244146529376',
    projectId: 'fast-media-d46c3',
    storageBucket: 'fast-media-d46c3.appspot.com',
    iosClientId: '244146529376-4j0el5sp55hjuiqr31e29p85vpraq4s7.apps.googleusercontent.com',
    iosBundleId: 'com.example.fastMedia',
  );
}
