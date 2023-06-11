import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuthUseCase<T, Parameters> {
  Future<Either<FirebaseAuthException, T>> call(Parameters parameters);
}

class NoParameter extends Equatable {
  const NoParameter();
  @override
  List<Object> get props => [];
}