import 'package:flutter/material.dart';
import 'package:flutter_application_1/Box/Transaction.dart';
import 'package:flutter_application_1/Singup/account.dart';
import 'package:flutter_application_1/database/transaction_db.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/widgetmenu/Chart.dart';
import 'package:flutter_application_1/widgetmenu/Firstscreen.dart';
import 'package:flutter_application_1/Tabmanu/container.dart';
import 'package:flutter_application_1/Tabmanu/expenses.dart';
import 'package:flutter_application_1/other/constans.dart';
import 'package:flutter_application_1/other/components.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String saldoAtual = "";
  final bodypage = [
    Secondscreen(),
    Chart(),
    Account()
  ];
  var width;
  var height;
  int _selectedIndex = 0;

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: bodypage[_selectedIndex],
        //แถบเมนูปุ่มข้างล่าง
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_chart),
              label: 'Chart',
              backgroundColor: Colors.orange,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance),
              label: 'Account',
              backgroundColor: Colors.blue,
              ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,  
        ),
    );
  }
}
