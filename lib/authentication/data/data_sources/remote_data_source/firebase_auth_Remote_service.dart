import 'package:fast_media/authentication/domain/use_cases/confirm_new_password_usecase.dart';
import 'package:fast_media/authentication/domain/use_cases/forget_password_usecase.dart';
import 'package:fast_media/authentication/domain/use_cases/sign_in_with_email_usecase.dart';
import 'package:fast_media/authentication/domain/use_cases/sign_up_with_email_usecase.dart';
import 'package:fast_media/authentication/domain/use_cases/verify_password_reset_code_usecase.dart';
import 'package:fast_media/core/base_usercase/base_auth_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';


abstract class BaseFirebaseAuthRemoteDataSource {
  Stream<User?> authChanges(NoParameter parameters);
  Future<UserCredential> signUpWithEmail(SignUpWithEmailParameter parameters);
  Future<UserCredential> signInWithEmail(SignInWithEmailParameter parameters);
  Future<UserCredential> signInWithGoogle(NoParameter parameters);
  Future<UserCredential> signInWithFaceBook(NoParameter parameters);
  Future<UserCredential> signInWithApple(NoParameter parameters);
  Future<void> forgetPassword(ForgetPasswordParameter parameters);
  Future<void> signOut(NoParameter parameters);
  Future<String> verifyPasswordResetCode(VerifyPasswordResetCodeParameter parameters);
  Future<void> confirmNewPassword(ConfirmNewPasswordParameter parameters);
  Future<void> verifyEmail(NoParameter parameters);
}
class FirebaseAuthRemoteService extends BaseFirebaseAuthRemoteDataSource {
  FirebaseAuth auth ;
  FirebaseAuthRemoteService(this.auth);

  @override
  Stream<User?> authChanges(NoParameter parameters) {
    return auth.authStateChanges();
  }

  @override
  Future<UserCredential> signUpWithEmail(SignUpWithEmailParameter parameters) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: parameters.email, password: parameters.password);
      await verifyEmail(const NoParameter());
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<UserCredential> signInWithEmail(SignInWithEmailParameter parameters) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: parameters.email, password: parameters.password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  // Future<void> verifyEmail() async {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user != null && !user.emailVerified) {
  //     return await user.sendEmailVerification();
  //   }
  // }

  @override
  Future<void> signOut(NoParameter parameters) async {
    return await FirebaseAuth.instance.signOut();
  }

  @override
  Future<UserCredential> signInWithApple(NoParameter parameters) async {
    try {
      UserCredential userCredential = await auth.signInWithProvider(GoogleAuthProvider());
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<UserCredential> signInWithFaceBook(NoParameter parameters) async {
    try {
      UserCredential userCredential = await auth.signInWithProvider(FacebookAuthProvider());
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<UserCredential> signInWithGoogle(NoParameter parameters) async {
    try {
      UserCredential userCredential = await auth.signInWithProvider(AppleAuthProvider());
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<void> forgetPassword(ForgetPasswordParameter parameters) async {
    try {
      await auth.sendPasswordResetEmail(email: parameters.email,);
    }on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<void> confirmNewPassword(ConfirmNewPasswordParameter parameters) async {
    try {
      await auth.confirmPasswordReset(code: parameters.code, newPassword: parameters.password);
    }on FirebaseAuthException catch (e){
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<String> verifyPasswordResetCode(VerifyPasswordResetCodeParameter parameters) async {
    try {
      return await auth.verifyPasswordResetCode(parameters.code);
    }on FirebaseAuthException catch (e){
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<void> verifyEmail(NoParameter parameters) async {
      await auth.currentUser?.sendEmailVerification();
  }



}
