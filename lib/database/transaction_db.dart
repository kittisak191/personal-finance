import 'dart:io';
import 'package:flutter_application_1/Box/Transaction.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class TransactionDB {
  //บริการเกี่ยวกับฐานข้อมูล

  String dbName; //เก็บชื่อฐานข้อมูล

  // ถ้ายังไม่ถูกสร้าง => สร้าง
  // ถูกสร้างไว้แล้ว => เปิด
  TransactionDB({required this.dbName});

  get record => null;

  Future<Database> openDatabase() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String dbLocation = join(appDirectory.path, dbName);
    //สร้าง database
    DatabaseFactory dbFactory = await databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);
    return db;
  }

  //บันทึกข้อมูล
  Future<int> InsertData(Transactions stastement) async {
    //ฐานข้อมูล => Store
    // transaction.db => newshop
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("newshop");

    //json
    var keyID = store.add(db, {
      "title": stastement.title,
      "amount": stastement.amount,
      "date": stastement.date.toIso8601String()
    });
    db.close();
    return keyID;
  }
  //ดึงข้อมูล
  Future <bool> loadAllData() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("newshop");
    var snapshot = await store.find(db);
    List transactionList = [];
    //ดึงมาทีละแถว
    transactionList.add(
      Transactions(
        title: record["title"], 
        amount: record["amount"], 
        date: DateTime.parse(record["date"])
        )
      );
    return true;
  }
}
