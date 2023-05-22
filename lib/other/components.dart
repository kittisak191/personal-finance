import 'package:flutter/material.dart';
import 'package:flutter_application_1/Tabmanu/expenses.dart';

class AlretComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.money_off),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Expenses()));
                },
                child: Text("expenses"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
