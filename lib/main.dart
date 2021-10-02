import 'package:flutter/material.dart';
import 'package:mh_forum/login/authentication_service.dart';
import 'home.dart';
import 'login/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        )
      ],
      child: MaterialApp(
        title: 'MHForum',
//        routes: <String, WidgetBuilder>{
//          '/': (BuildContext context) => new LoginPage(),
//        },
//        initialRoute: '/',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget{
  Widget build(BuildContext context){
    final firebaseUser = context.watch<User>();
    if (firebaseUser != null){
      return HomePage();
    }else{
      return LoginPage();
    }
  }
}