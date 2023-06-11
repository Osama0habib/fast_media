import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class BaseFireStoreUseCase<T, Parameters> {
  Future<Either<FirebaseException, T>> call(Parameters parameters);
}

class NoParameter extends Equatable {
  const NoParameter();
  @override
  List<Object> get props => [];
}