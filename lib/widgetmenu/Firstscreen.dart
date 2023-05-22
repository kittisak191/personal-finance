import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/other/constans.dart';
import 'package:flutter_application_1/homescreen/Secondscreen.dart';

 class Firstscreen extends StatefulWidget {
   const Firstscreen({ Key? key }) : super(key: key);
 
   @override
   _FirstscreenState createState() => _FirstscreenState();
 }
 
 class _FirstscreenState extends State<Firstscreen> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body:SafeArea(
       child: SizedBox(
         width: double.infinity,
          child: Column(
           children: <Widget>[
             Expanded(
               child: Column(
                 children: <Widget>[
                   Text("Personal finance",
                   style: TextStyle(
                     fontSize: 35,
                     fontFamily: "Nongnew",
                     color: kPrimaryColor,
                     fontWeight: FontWeight.bold
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Spacer(),
                  ),
                  Image.asset(
                    "assets/maibok.jpg",
                    ),
                  Spacer(),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 40,
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            color: Colors.green,
                            width: double.infinity,
                            height: 55,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context, MaterialPageRoute(
                                    builder: (context) => Homepage(),
                                    ),
                                  );
                                },
                              child: Text(
                                "Get Start",
                                  style: TextStyle(
                                  fontSize: 35,
                                  fontFamily: 'Nongnew',
                                  color: Colors.white
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
     );
   }
 }