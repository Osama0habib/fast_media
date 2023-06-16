part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationStarted extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}

class AuthenticationSignedOut extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}

class GetUSerDataEvent extends AuthenticationEvent {
  final String id;

  const GetUSerDataEvent(this.id);

  @override
  List<Object> get props => [id];

}
