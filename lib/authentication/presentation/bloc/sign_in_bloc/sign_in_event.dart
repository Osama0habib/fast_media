part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();
}

class SignInPressedEvent extends SignInEvent {
  final SignInWithEmailParameter signInWithEmailParameter;

  const SignInPressedEvent(this.signInWithEmailParameter);

  @override
  List<Object> get props => [signInWithEmailParameter];
}

class GooglePressedEvent extends SignInEvent {
  const GooglePressedEvent();

  @override
  List<Object> get props => [];
}

class FaceBookPressedEvent extends SignInEvent {
  const FaceBookPressedEvent();

  @override
  List<Object> get props => [];
}

class ApplePressedEvent extends SignInEvent {
  const ApplePressedEvent();

  @override
  List<Object> get props => [];
}

class ForgetPasswordPressedEvent extends SignInEvent {
  const ForgetPasswordPressedEvent();

  @override
  List<Object> get props => [];
}

class RememberMePressedEvent extends SignInEvent {
  const RememberMePressedEvent();

  @override
  List<Object> get props => [];
}

class EmailChangesEvent extends SignInEvent {
  final String email;

  const EmailChangesEvent(this.email);

  @override
  List<Object> get props => [];
}

class PasswordChangesEvent extends SignInEvent {
  final String password;

  const PasswordChangesEvent(this.password);

  @override
  List<Object> get props => [];
}

class GetUSerDataEvent extends SignInEvent {
  final String id;

  const GetUSerDataEvent(this.id);

  @override
  List<Object> get props => [id];

}

