import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';

class SignUpException extends FirebaseAuthException {
  SignUpException([code = 'An unkown exception']) : super(code: code);

  factory SignUpException.fromCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return SignUpException('Your email is already in use by another account');
      case 'invalid-email':
        return SignUpException('Your email address is not valid');
      case 'operation-not-allowed':
        return SignUpException('This app is under maintenance');
      case 'weak-password':
        return SignUpException(
            'Your password is too weak, please use a stronger password');
      default:
        return SignUpException();
    }
  }
}

class SignInException extends FirebaseAuthException {
  SignInException([code = 'An unkown exception']) : super(code: code);

  factory SignInException.fromCode(String code) {
    log(
      'code: $code',
      name: 'SignInException',
    );
    switch (code) {
      case 'invalid-email':
        return SignInException('Your email address is not valid');
      case 'user-disabled':
        return SignInException('Your email has been disabled');
      case 'user-not-found':
        return SignInException('Your email was not found');
      case 'invalid-credential':
        return SignInException('Your Email or Password are wrong');
      case 'channel-error':
        return SignInException('Email and Password is required');
      default:
        return SignInException();
    }
  }
}
