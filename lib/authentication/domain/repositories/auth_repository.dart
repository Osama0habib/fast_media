import 'package:dartz/dartz.dart';
import 'package:fast_media/authentication/data/data_sources/remote_data_source/database_remote_datasource.dart';
import 'package:fast_media/authentication/domain/use_cases/confirm_new_password_usecase.dart';
import 'package:fast_media/authentication/domain/use_cases/forget_password_usecase.dart';
import 'package:fast_media/authentication/domain/use_cases/sign_in_with_email_usecase.dart';
import 'package:fast_media/authentication/domain/use_cases/sign_up_with_email_usecase.dart';
import 'package:fast_media/authentication/domain/use_cases/verify_password_reset_code_usecase.dart';
import 'package:fast_media/core/base_usercase/base_auth_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../data/data_sources/remote_data_source/firebase_auth_Remote_service.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/base_auth_repository.dart';
import '../use_cases/verify_email_usecase.dart';

class AuthRepository implements BaseAuthRepository {
  FirebaseAuthRemoteService firebaseAuthRemoteService ;

  AuthRepository(this.firebaseAuthRemoteService);

  @override
  Stream<User?> authChanges(NoParameter parameters) {
   return firebaseAuthRemoteService.authChanges(parameters);
  }

  @override
  Future<Either<FirebaseAuthException, UserCredential>> signInWithApple(NoParameter parameters) async {
    final result = await firebaseAuthRemoteService.signInWithApple(parameters);
    return _sharedResult(result);
  }

  @override
  Future<Either<FirebaseAuthException, UserCredential>> signInWithEmail(SignInWithEmailParameter parameters) async {
    final result = await firebaseAuthRemoteService.signInWithEmail(parameters);
    return _sharedResult(result);
  }

  @override
  Future<Either<FirebaseAuthException, UserCredential>> signInWithFacebook(NoParameter parameters) async {
    final result = await firebaseAuthRemoteService.signInWithFaceBook(parameters);
    return _sharedResult(result);
  }

  @override
  Future<Either<FirebaseAuthException, UserCredential>> signInWithGoogle(NoParameter parameters) async {
    final result = await firebaseAuthRemoteService.signInWithGoogle(parameters);
    return _sharedResult(result);
  }

  @override
  Future<Either<FirebaseAuthException, void>> signOut(NoParameter parameters) async {
    final result = await firebaseAuthRemoteService.signOut(parameters);
    try {
      return Right(result);
    }on FirebaseAuthException catch (e){
      return Left(FirebaseAuthException(code: e.code,message: e.message));
    }
  }

  @override
  Future<Either<FirebaseAuthException, UserCredential>> signUpWithEmail(SignUpWithEmailParameter parameters) async {
    final result = await firebaseAuthRemoteService.signUpWithEmail(parameters);
    return _sharedResult(result);
  }

  @override
  Future<Either<FirebaseAuthException, void>> confirmNewPassword(ConfirmNewPasswordParameter parameters) async {
    final result = await firebaseAuthRemoteService.confirmNewPassword(parameters);
    try {
      return Right(result);
    }on FirebaseAuthException catch (e){
      return Left(FirebaseAuthException(code: e.code,message: e.message));
    }
  }

  @override
  Future<Either<FirebaseAuthException, void>> forgetPassword(ForgetPasswordParameter parameters) async {
    final result = await firebaseAuthRemoteService.forgetPassword(parameters);
    try {
      return Right(result);
    }on FirebaseAuthException catch (e){
      return Left(FirebaseAuthException(code: e.code,message: e.message));
    }
  }

  @override
  Future<Either<FirebaseAuthException, void>> verifyEmail(NoParameter parameters) async {
    final result = await firebaseAuthRemoteService.verifyEmail(parameters);
    try {
      return Right(result);
    }on FirebaseAuthException catch (e){
      return Left(FirebaseAuthException(code: e.code,message: e.message));
    }
  }

  @override
  Future<Either<FirebaseAuthException, String>> verifyPasswordResetCode(VerifyPasswordResetCodeParameter parameters) async {
    final result = await firebaseAuthRemoteService.verifyPasswordResetCode(parameters);
    return _sharedResult(result);
  }


  _sharedResult(dynamic result){
    try {
      return Right(result);
    }on FirebaseAuthException catch (e){
      return Left(FirebaseAuthException(code: e.code,message: e.message));
    }
  }
}

