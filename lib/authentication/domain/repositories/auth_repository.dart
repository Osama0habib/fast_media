import 'package:dartz/dartz.dart';
import 'package:fast_media/authentication/domain/use_cases/confirm_new_password_usecase.dart';
import 'package:fast_media/authentication/domain/use_cases/forget_password_usecase.dart';
import 'package:fast_media/authentication/domain/use_cases/sign_in_with_email_usecase.dart';
import 'package:fast_media/authentication/domain/use_cases/sign_up_with_email_usecase.dart';
import 'package:fast_media/authentication/domain/use_cases/verify_password_reset_code_usecase.dart';
import 'package:fast_media/core/base_usercase/base_auth_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../data/repositories/base_auth_repository.dart';

class AuthRepository implements BaseAuthRepository {
  final _auth = FirebaseAuth.instance;

  AuthRepository();

  @override
  Stream<User?> authChanges(NoParameter parameters) {
    return _auth.authStateChanges();
  }

  @override
  Future<Either<FirebaseAuthException, UserCredential>> signInWithApple(
      NoParameter parameters) async {
    try {
      final result = await _auth.signInWithProvider(AppleAuthProvider());
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseAuthException(code: e.code, message: e.message));
    }
  }

  @override
  Future<Either<FirebaseAuthException, UserCredential>> signInWithEmail(
      SignInWithEmailParameter parameters) async {
    // return result;
    try {
      final result = await _auth.signInWithEmailAndPassword(
          email: parameters.email, password: parameters.password);
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseAuthException(code: e.code, message: e.message));
    }
  }

  @override
  Future<Either<FirebaseAuthException, UserCredential>> signInWithFacebook(
      NoParameter parameters) async {
    try {
      final result = await _auth.signInWithProvider(FacebookAuthProvider());
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseAuthException(code: e.code, message: e.message));
    }
  }

  @override
  Future<Either<FirebaseAuthException, UserCredential>> signInWithGoogle(
      NoParameter parameters) async {
    try {
      final result = await _auth.signInWithProvider(GoogleAuthProvider());

      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseAuthException(code: e.code, message: e.message));
    }
  }

  @override
  Future<Either<FirebaseAuthException, void>> signOut(
      NoParameter parameters) async {
    try {
      final result = await _auth.signOut();
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseAuthException(code: e.code, message: e.message));
    }
  }

  @override
  Future<Either<FirebaseAuthException, UserCredential>> signUpWithEmail(
      SignUpWithEmailParameter parameters) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
          email: parameters.email, password: parameters.password);

      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseAuthException(code: e.code, message: e.message));
    }
  }

  @override
  Future<Either<FirebaseAuthException, void>> confirmNewPassword(
      ConfirmNewPasswordParameter parameters) async {
    try {
      final result = await _auth.confirmPasswordReset(
          code: parameters.code, newPassword: parameters.password);

      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseAuthException(code: e.code, message: e.message));
    }
  }

  @override
  Future<Either<FirebaseAuthException, void>> forgetPassword(
      ForgetPasswordParameter parameters) async {
    try {
      final result = await _auth.sendPasswordResetEmail(
          email: parameters.email,
          actionCodeSettings: ActionCodeSettings(
            url: "https://fastmedia.page.link/resetPassword",
            // dynamicLinkDomain: "https://fastmedia.page.link",
            androidInstallApp: false,
            androidPackageName: "com.example.fast_media", handleCodeInApp: true,
            iOSBundleId: "com.example.fast_media",
          ));

      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseAuthException(code: e.code, message: e.message));
    }
  }

  @override
  Future<Either<FirebaseAuthException, void>> verifyEmail(
      NoParameter parameters) async {
    try {
      final result = await _auth.currentUser?.sendEmailVerification();

      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseAuthException(code: e.code, message: e.message));
    }
  }

  @override
  Future<Either<FirebaseAuthException, String>> verifyPasswordResetCode(
      VerifyPasswordResetCodeParameter parameters) async {
    try {
      final result = await _auth.verifyPasswordResetCode(parameters.code);
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseAuthException(code: e.code, message: e.message));
    }
  }

// _sharedResult(dynamic result){
//   try {
//     return Right(result);
//   }on FirebaseAuthException catch (e){
//     return Left(FirebaseAuthException(code: e.code,message: e.message));
//   }
// }
}
