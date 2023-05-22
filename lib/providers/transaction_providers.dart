import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/Box/Transaction.dart';
import 'package:flutter_application_1/database/transaction_db.dart';
import 'package:flutter_application_1/widgetmenu/Chart.dart';

class TransactionProvider with ChangeNotifier{
  //ตัวอย่างข้อมูล
    List<Transactions> transactions = [];


    //ดึงข้อมูล
    List<Transactions> getTransaction(){
      return transactions;
    }
    
    void addTransaction(Transactions? statement) async{
      if(statement == null) return;
    var db = TransactionDB(dbName: "transactions.db");
      //บันทึกข้อมูล
      await db.InsertData(statement);
      transactions.insert(0,statement);
      //แจ้งเตือน Consumer
      notifyListeners();
    }

  void initData() {}
}