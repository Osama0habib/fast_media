import 'package:dartz/dartz.dart';
import 'package:fast_media/authentication/domain/use_cases/confirm_new_password_usecase.dart';
import 'package:fast_media/authentication/domain/use_cases/forget_password_usecase.dart';
import 'package:fast_media/authentication/domain/use_cases/sign_in_with_email_usecase.dart';
import 'package:fast_media/authentication/domain/use_cases/verify_password_reset_code_usecase.dart';
import 'package:fast_media/core/base_usercase/base_auth_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/use_cases/sign_up_with_email_usecase.dart';

abstract class BaseAuthRepository {
  Stream<User?> authChanges(NoParameter parameters);
  Future<Either<FirebaseAuthException, UserCredential>> signUpWithEmail(
      SignUpWithEmailParameter parameters);
  Future<Either<FirebaseAuthException, UserCredential>> signInWithEmail(
      SignInWithEmailParameter parameters);
  Future<Either<FirebaseAuthException, UserCredential>> signInWithGoogle(
      NoParameter parameters);
  Future<Either<FirebaseAuthException, UserCredential>> signInWithFacebook(
      NoParameter parameters);
  Future<Either<FirebaseAuthException, UserCredential>> signInWithApple(
      NoParameter parameters);
  Future<Either<FirebaseAuthException, void>> signOut(NoParameter parameters);
  Future<Either<FirebaseAuthException, void>> forgetPassword(
      ForgetPasswordParameter parameters);
  Future<Either<FirebaseAuthException, String>> verifyPasswordResetCode(
      VerifyPasswordResetCodeParameter parameters);
  Future<Either<FirebaseAuthException, void>> confirmNewPassword(
      ConfirmNewPasswordParameter parameters);
  Future<Either<FirebaseAuthException, void>> verifyEmail(
      NoParameter parameters);

  // Future<String?> retrieveUserName(UserModel user);
}
