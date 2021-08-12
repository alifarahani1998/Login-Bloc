part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AppStarted extends AuthEvent {
  @override
  String toString() => 'AppStarted';
}

class LoggedIn extends AuthEvent {
  final String token;

  LoggedIn({@required this.token});

  @override
  String toString() => 'LoggedIn { token: $token }';
}

class LoggedOut extends AuthEvent {
  @override
  String toString() => 'LoggedOut';
}