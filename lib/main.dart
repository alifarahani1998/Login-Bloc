import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/views/screens/home_screen.dart';
import 'package:login_bloc/views/screens/login_screen.dart';
import 'package:login_bloc/views/screens/splash_screen.dart';
import 'package:login_bloc/views/widgets/progress_indicator.dart';
import 'blocs/auth/auth_bloc.dart';
import 'repositories/user_repository.dart';
import 'routes/routes.dart';

void main() {
  runApp(MyApp(
    userRepository: UserRepository(),
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatefulWidget {
  final UserRepository userRepository;
  final AppRouter appRouter;

  MyApp({Key key, @required this.userRepository, @required this.appRouter})
      : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthBloc authBloc;

  @override
  void initState() {
    super.initState();
    authBloc = AuthBloc(userRepository: widget.userRepository);
    authBloc.add(AppStarted());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => authBloc),
      ],
      child: MaterialApp(
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (BuildContext context, AuthState state) {
            if (state is AuthUninitialized) {
              return SplashScreen();
            }
            if (state is AuthAuthenticated) {
              return HomeScreen();
            }
            if (state is AuthUnauthenticated) {
              return LoginScreen(userRepository: widget.userRepository);
            }
            if (state is AuthLoading) {
              return LoadingIndicator();
            }
            return Container();
          },
        ),
        onGenerateRoute: widget.appRouter.onGenerateRote,
      ),
    );
  }
}
