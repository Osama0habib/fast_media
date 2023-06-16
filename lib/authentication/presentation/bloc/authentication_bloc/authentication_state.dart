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
  final UserModel currentUser;

  const AuthenticationSuccess(this.currentUser);

  @override
  List<Object?> get props => [currentUser];
}

class AuthenticationFailure extends AuthenticationState {
  const AuthenticationFailure();

  @override
  List<Object?> get props => [];
}

class GetUserDataState extends AuthenticationState {
  final bool isSuccess;
  final String errorMsg;
  final UserModel? currentUser;

  const GetUserDataState(
      {required this.isSuccess, this.errorMsg = "", this.currentUser});

  @override
  List<Object?> get props => [isSuccess, errorMsg, currentUser];
}

