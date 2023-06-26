import 'package:dartz/dartz.dart';
import 'package:fast_media/core/base_usercase/base_auth_usecase.dart';
import 'package:firebase_auth_platform_interface/src/firebase_auth_exception.dart';

import '../../data/repositories/base_auth_repository.dart';

class VerifyEmailUseCase extends BaseAuthUseCase<void, NoParameter> {
  BaseAuthRepository baseAuthRepository;
  VerifyEmailUseCase(this.baseAuthRepository);
  @override
  Future<Either<FirebaseAuthException, void>> call(
      NoParameter parameters) async {
    return await baseAuthRepository.verifyEmail(parameters);
  }
}

// class VerifyEmailParameter extends Equatable {
//
//   final String email;
//
//   const VerifyEmailParameter({ required this.email});
//
//   @override
//   List<Object> get props => [email,];
// }

