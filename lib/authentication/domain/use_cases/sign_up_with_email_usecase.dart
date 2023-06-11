import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_media/core/base_usercase/base_auth_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../data/repositories/base_auth_repository.dart';

class SignUpWithEmailUseCase extends BaseAuthUseCase<UserCredential,SignUpWithEmailParameter> {

  BaseAuthRepository baseAuthRepository ;
  SignUpWithEmailUseCase(this.baseAuthRepository);
  @override
  Future<Either<FirebaseAuthException, UserCredential>> call(SignUpWithEmailParameter parameters) async {
    return await baseAuthRepository.signUpWithEmail(parameters);
  }


}

class SignUpWithEmailParameter extends Equatable {

  final String email;
  final String password;

  const SignUpWithEmailParameter({required this.email, required this.password});

  @override
  List<Object> get props => [email,password,];
}