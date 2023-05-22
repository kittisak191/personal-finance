import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_application_1/Singup/register.dart';
import 'package:flutter_application_1/Singup/login.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  
  //ฟอร์ม Account
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Account",
        style: TextStyle(fontSize: 45,
        fontFamily: 'Nongnew'
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset("assets/images.png"),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
                child: ElevatedButton.icon(
                  icon:Icon(Icons.add), 
                  label: Text(
                      "create account",
                        style: TextStyle(fontSize: 20,
                        fontFamily: 'Nongnew'),
                    ),
                    onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context){
                              return Registerscreen();
                          })
                        );
                    }
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
            SizedBox(
              height: 50,
              width: double.infinity,
                child: ElevatedButton.icon(
                  icon:Icon(Icons.login), 
                  label: Text(
                      "sign in",
                        style: TextStyle(fontSize: 20,
                        fontFamily: 'Nongnew'),
                    ),
                    onPressed: () {
                        Navigator.push(context,MaterialPageRoute(
                          builder: (context){
                              return Loginscreen();
                    })
                  );
                },
              ),
            ),
          ],
        ),
      ),       
    );  
  }
}
 