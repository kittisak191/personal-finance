import 'package:flutter/material.dart';
import 'package:flutter_application_1/Box/Transaction.dart';
import 'package:flutter_application_1/homescreen/Secondscreen.dart';
import 'package:flutter_application_1/providers/transaction_providers.dart';
import 'package:flutter_application_1/main.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/widgetmenu/Firstscreen.dart';
import 'package:flutter_application_1/Tabmanu/expenses.dart';
import 'package:flutter_application_1/other/constans.dart';

class Secondscreen extends StatefulWidget {
  const Secondscreen({Key? key}) : super(key: key);
  @override
  _SecondscreenState createState() => _SecondscreenState();
}

class _SecondscreenState extends State<Secondscreen> {
  String saldoAtual = "";
  var Total;
  var total;
  var width;
  var height;
  int _selectedIndex = 0;
  bool recDesp = false;
  List<Transactions> listtransation = [];
  TextEditingController _valorController = TextEditingController();

  final GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    var data;
    return Scaffold(
        appBar: AppBar(
          title: Text("Finance",
          style: TextStyle(
            fontSize: 45,
            fontFamily: 'Nongnew'
            ),
          ),
          backgroundColor: Colors.green,
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
        floatingActionButton: showFAB(),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Consumer(builder: (context, TransactionProvider provider, child) {
          var count = provider.transactions.length;
          if (count <= 0) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.account_balance_wallet,
                  size: 80,
                  color: Colors.green,),
                  SizedBox(
                    height: 20,
                  ),
                  Text("waste no money",
                  style: TextStyle(fontSize: 40,
                  color: Colors.green,
                  fontFamily: 'Nongnew'
                  ),
                  ),
                ],
              ),
            );
          } else {
            return ListView.builder(
                itemCount: provider.transactions.length,
                itemBuilder: (context, int index) {
                  Transactions data = provider.transactions[index];
                  return Card(
                    elevation: 5,
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: FittedBox(
                          child: Text(data.amount.toString()),
                        ),
                      ),
                      title: Text(data.title),
                      subtitle:
                          Text(DateFormat("dd/MM/yyyy").format(data.date)),
                ),
              );
          });
        }
      })
    );
  }
  Widget showFAB() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.green,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("add"),
            content: Container(
              height: MediaQuery.of(context).size.height / 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.monetization_on_sharp),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Expenses()));
                                },
                                child: Text("Expenses"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            Navigator.pop(context);
                          });
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
