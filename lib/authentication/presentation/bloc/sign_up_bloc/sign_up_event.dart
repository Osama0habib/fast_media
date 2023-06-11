part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
}

class SignUpWithEmailEvent extends SignUpEvent {
  final String email;
  final String password;
  final String userName;
  final String phone;

  const SignUpWithEmailEvent(
      {required this.email, required this.password, required this.userName, required this.phone});

  @override
  List<Object> get props => [email, password, userName, phone];

}

class EmailChangesEvent extends SignUpEvent {
  final String email;

  const EmailChangesEvent(this.email);

  @override
  List<Object> get props => [];
}

class PasswordChangesEvent extends SignUpEvent {
  final String password;

  const PasswordChangesEvent(this.password);

  @override
  List<Object> get props => [];
}

class UserNameChangesEvent extends SignUpEvent {
  final String useName;

  const UserNameChangesEvent(this.useName);

  @override
  List<Object> get props => [];
}

class PhoneChangesEvent extends SignUpEvent {
  final String phone;

  const PhoneChangesEvent(this.phone);

  @override
  List<Object> get props => [];
}

class SaveUserDataEvent extends SignUpEvent {
  final UserModel userModel;

  const SaveUserDataEvent(this.userModel);

  @override
  List<Object> get props => [userModel];

}
