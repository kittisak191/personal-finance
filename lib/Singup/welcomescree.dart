import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Singup/account.dart';

class Weclcomescreen extends StatelessWidget {
  
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("Welcome to Flutter",
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(auth.currentUser!.email!,style: TextStyle(fontSize: 25),),
              ElevatedButton(
                child: Text("Log out"),
                onPressed: (){
                  auth.signOut().then((value){
                    Navigator.pushReplacement(context, 
                    MaterialPageRoute(builder: (context){
                      return Account();
                    }));
                  });
                },
              )
            ],
          ),
        ),
    );
  }
}