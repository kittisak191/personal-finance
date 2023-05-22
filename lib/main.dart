import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Box/Transaction.dart';
import 'package:flutter_application_1/providers/transaction_providers.dart';
import 'package:flutter_application_1/other/constans.dart';
import 'package:flutter_application_1/Tabmanu/container.dart';
import 'package:flutter_application_1/widgetmenu/Firstscreen.dart';
import 'package:flutter_application_1/homescreen/Secondscreen.dart';
import 'package:provider/provider.dart';

void main()  {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>  {
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context){
          return TransactionProvider();
        })
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/homescreen',
        routes: {
          '/homescreen': (context) => const Firstscreen(),
          '/homepage': (context) => const Secondscreen(),
        },
      ),
    );
  }
}