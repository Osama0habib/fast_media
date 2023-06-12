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
  FirebaseAuthRemoteService();
  final _auth  = FirebaseAuth.instance;

  @override
  Stream<User?> authChanges(NoParameter parameters) {
    return _auth.authStateChanges();
  }

  @override
  Future<UserCredential> signUpWithEmail(SignUpWithEmailParameter parameters) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: parameters.email, password: parameters.password);
      await verifyEmail(const NoParameter());

      return userCredential;
    } on FirebaseAuthException catch (e) {
      print("exception  : $e" );
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<UserCredential> signInWithEmail(SignInWithEmailParameter parameters)  {
    // try {
      return  _auth.signInWithEmailAndPassword(
          email: parameters.email, password: parameters.password);
    // } on FirebaseAuthException catch (e) {
    //   print("salfknalkfn : $e");
    //   throw FirebaseAuthException(code: e.code, message: e.message);
    // }
  }

  // Future<void> verifyEmail() async {
  //   User? user = Firebase_auth.instance.currentUser;
  //   if (user != null && !user.emailVerified) {
  //     return await user.sendEmailVerification();
  //   }
  // }

  @override
  Future<void> signOut(NoParameter parameters) async {
    return await _auth.signOut();
  }

  @override
  Future<UserCredential> signInWithApple(NoParameter parameters) async {
    try {
      UserCredential userCredential = await _auth.signInWithProvider(AppleAuthProvider());
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<UserCredential> signInWithFaceBook(NoParameter parameters) async {
    try {
      UserCredential userCredential = await _auth.signInWithProvider(FacebookAuthProvider());
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<UserCredential> signInWithGoogle(NoParameter parameters) async {
    try {
      UserCredential userCredential = await _auth.signInWithProvider(GoogleAuthProvider());
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<void> forgetPassword(ForgetPasswordParameter parameters) async {
    try {
      await _auth.sendPasswordResetEmail(email: parameters.email,);
    }on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<void> confirmNewPassword(ConfirmNewPasswordParameter parameters) async {
    try {
      await _auth.confirmPasswordReset(code: parameters.code, newPassword: parameters.password);
    }on FirebaseAuthException catch (e){
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<String> verifyPasswordResetCode(VerifyPasswordResetCodeParameter parameters) async {
    try {
      return await _auth.verifyPasswordResetCode(parameters.code);
    }on FirebaseAuthException catch (e){
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<void> verifyEmail(NoParameter parameters) async {
      await _auth.currentUser?.sendEmailVerification();
  }



}
