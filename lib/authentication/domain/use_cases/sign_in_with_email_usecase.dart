import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_media/authentication/data/repositories/base_auth_repository.dart';
import 'package:fast_media/core/base_usercase/base_auth_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInWithEmailUseCase extends BaseAuthUseCase<UserCredential,SignInWithEmailParameter> {

  BaseAuthRepository baseAuthRepository ;
  SignInWithEmailUseCase(this.baseAuthRepository);

  @override
  Future<Either<FirebaseAuthException, UserCredential>> call(SignInWithEmailParameter parameters) async {
    return await baseAuthRepository.signInWithEmail(parameters);
  }


}

class SignInWithEmailParameter extends Equatable {

  final String email;
  final String password;

  const SignInWithEmailParameter({required this.email, required this.password});

  @override
  List<Object> get props => [email,password,];
}