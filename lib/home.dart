import 'package:flutter/material.dart';
import 'package:mh_forum/login/authentication_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("HOME"),
            RaisedButton(onPressed: (){
              context.read<AuthenticationService>().signOut();
            },
            child: Text("Sign out"),
            )
          ],
        )
      ),
    );
  }
}