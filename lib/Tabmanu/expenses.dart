import 'package:flutter/material.dart';
import 'package:flutter_application_1/Box/Transaction.dart';
import 'package:flutter_application_1/providers/transaction_providers.dart';
import 'package:flutter_application_1/other/constans.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_application_1/homescreen/Secondscreen.dart';
import 'package:provider/provider.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);
    @override
    _ExpensesState createState() => _ExpensesState();
  }
  
class _ExpensesState extends State<Expenses> {
  final formKey = GlobalKey<FormState>();

  // controller
  final titleController = TextEditingController();//รับค่ารายการ
  final amountController = TextEditingController();//รับค่าจำนวนเงิน

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        title: Text("Expenses",
        style: TextStyle(fontSize: 35,
        color: Colors.white
            ),
          ),
        ), 
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: new InputDecoration(labelText: "Listmenu"),
                  autofocus: true,
                  controller: titleController,
                  validator: (value) {
                    if(value!.isEmpty) {
                      return "Please enter Listmenu";
                    }
                  },
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "Money"),
                  keyboardType: TextInputType.number,
                  controller: amountController,
                  validator: (value) {
                    if(value!.isEmpty) {
                      return "Please enter Money";
                    }
                  },
                ),
                ElevatedButton(
                  child: Text("Add"),
                  onPressed: (){
                    if(formKey.currentState!.validate()){
                      var title = titleController.text;
                      var amount = amountController.text;
                      
                      //เตรียมข้อมูล
                      Transactions statement = Transactions(
                        title: title,
                        amount: double.parse(amount),
                        date: DateTime.now()
                      ); //object
                      //เรียก Provider
                      var provider = Provider.of<TransactionProvider>(context,listen:false);
                      provider.addTransaction(statement);
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
  