import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/blocs/auth/auth_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        title: Text('Home'),
      ),
      body: Container(
        child: Center(
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
                showDialog<void>(
                  context: context,
                  builder: (BuildContext dialogContext) {
                    return AlertDialog(
                      content: Text('Do you want to exit?'),
                      actions: <Widget>[
                        Row(
                          children: [
                            FlatButton(
                              child: Text('No'),
                              onPressed: () {
                                Navigator.of(dialogContext).pop();
                              },
                            ),
                            FlatButton(
                              child: Text('Yes'),
                              onPressed: () {
                                Navigator.of(dialogContext).pop();
                                authBloc.add(LoggedOut());
                              },
                            ),
                          ],
                        )
                      ],
                    );
                  },
                );
              },
            )
          ],
        )),
      ),
    );
  }
}
