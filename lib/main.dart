import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wuyiyit/connectToServer.dart';
import 'package:wuyiyit/providers/mainProvider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MainProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Wuyiyit',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ConnectToServer(),
      ),
    );
  }
}
