part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object?> get props => [];
}

class AuthenticationInitial extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AuthenticationSuccess extends AuthenticationState {
  const AuthenticationSuccess();

  @override
  List<Object?> get props => [];
}

class AuthenticationFailure extends AuthenticationState {
  const AuthenticationFailure();
  @override
  List<Object?> get props => [];
}
