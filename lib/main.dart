import 'package:flutter/material.dart';
import 'package:flutter_appauth_scene_delegate/keycloak_auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
              onPressed: () async {
                await AuthUtilsKeycloak.instance.authorizeAndExchangeCode();
              },
              child: Text("Authorize"),
            ),
            OutlinedButton(
              onPressed: () async {
                await AuthUtilsKeycloak.instance.logOut();
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
