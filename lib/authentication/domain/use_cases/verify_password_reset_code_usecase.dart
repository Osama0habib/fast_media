import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_media/core/base_usercase/base_auth_usecase.dart';
import 'package:firebase_auth_platform_interface/src/firebase_auth_exception.dart';

import '../../data/repositories/base_auth_repository.dart';


class VerifyPasswordCodeUseCase extends BaseAuthUseCase<String,VerifyPasswordResetCodeParameter>{
  BaseAuthRepository baseAuthRepository ;
  VerifyPasswordCodeUseCase(this.baseAuthRepository);
  @override
  Future<Either<FirebaseAuthException, String>> call(VerifyPasswordResetCodeParameter parameters) async {
    return await baseAuthRepository.verifyPasswordResetCode(parameters);
  }

}
class VerifyPasswordResetCodeParameter extends Equatable {

  final String code;

  const VerifyPasswordResetCodeParameter({ required this.code});

  @override
  List<Object> get props => [code,];
}
