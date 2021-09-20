import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  AuthBloc authBloc;

  @override
  void initState() {
    super.initState();
    authBloc = BlocProvider.of<AuthBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('third screen'),
              onPressed: () {
                Navigator.pushNamed(context, '/third_screen');
              },
            ),
            RaisedButton(
              child: Text('logout'),
              onPressed: () {
                authBloc.add(LoggedOut());
                Navigator.of(context).popUntil((route) => route.settings.name == '/');
              },
            )
          ],
        )),
      ),
    );
  }
}
