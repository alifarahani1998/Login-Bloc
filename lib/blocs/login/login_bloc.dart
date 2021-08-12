import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:login_bloc/blocs/auth/auth_bloc.dart';
import 'package:login_bloc/repositories/user_repository.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final UserRepository userRepository;
  final AuthBloc authBloc;

  LoginBloc({@required this.userRepository, @required this.authBloc}) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final token = await userRepository.authenticate(
          username: event.username,
          password: event.password,
        );

        authBloc.add(LoggedIn(token: token));
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
