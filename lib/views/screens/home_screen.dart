import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/blocs/auth/auth_bloc.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  child: Text('second screen'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/second_screen');
                  },
                ),
                RaisedButton(
                  child: Text('logout'),
                  onPressed: () {
                    authBloc.add(LoggedOut());
                  },
                )
              ],
            )),
    );
  }
}