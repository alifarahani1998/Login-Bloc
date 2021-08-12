part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {

  final String username;
  final String password;

  LoginButtonPressed({@required this.username, @required this.password});

  @override
  String toString() => 'LoginButtonPressed { username: $username, password: $password }';
}
