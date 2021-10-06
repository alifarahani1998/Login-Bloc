import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Screen'),
      ),
      body: Container(
        child: Center(
            child: RaisedButton(
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
                            BlocProvider.of<AuthBloc>(context).add(LoggedOut());
                            Navigator.of(context).popUntil(
                                (route) => route.settings.name == '/');
                          },
                        ),
                      ],
                    )
                  ],
                );
              },
            );
          },
        )),
      ),
    );
  }
}
