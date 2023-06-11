import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_media/core/base_usercase/base_auth_usecase.dart';
import 'package:firebase_auth_platform_interface/src/firebase_auth_exception.dart';

import '../../data/repositories/base_auth_repository.dart';

class ForgetPasswordUseCase extends BaseAuthUseCase<void,ForgetPasswordParameter> {

  BaseAuthRepository baseAuthRepository ;
  ForgetPasswordUseCase(this.baseAuthRepository);
  @override
  Future<Either<FirebaseAuthException, void>> call(ForgetPasswordParameter parameters) async {
   return await baseAuthRepository.forgetPassword(parameters);
  }

}

class ForgetPasswordParameter extends Equatable {

  final String email;

  const ForgetPasswordParameter({ required this.email});

  @override
  List<Object> get props => [email,];
}