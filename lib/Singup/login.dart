import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Box/profile.dart';
import 'package:flutter_application_1/Singup/account.dart';
import 'package:flutter_application_1/Singup/welcomescree.dart';
import 'package:flutter_application_1/homescreen/Secondscreen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final formKey = GlobalKey<FormState>();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  Profile profile = Profile( email: '', password: '');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  "Eror",
                  style: TextStyle(
                    fontSize: 45, 
                    fontFamily: 'Nongnew'),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  "Login",
                  style: TextStyle(fontSize: 45, fontFamily: 'Nongnew'),
                ),
              ),
              body: Container(
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(fontSize: 20),
                        ),
                        TextFormField(
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: "Please enter Email ! "),
                            EmailValidator(errorText: "Email format invalid"),
                          ]),
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (String? email) {
                            profile.email = email!;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Password",
                          style: TextStyle(fontSize: 20),
                        ),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "Please enter Password ! "),
                          obscureText: true,
                          onSaved: (String? password) {
                            profile.password = password!;
                          },
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                fontSize: 45, 
                                fontFamily: 'Nongnew'),
                            ),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                try {
                                  await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: profile.email,
                                          password: profile.password)
                                      .then((value) {
                                    formKey.currentState!.reset();
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return Weclcomescreen();
                                    }));
                                  });
                                } on FirebaseAuthException catch (e) {
                                  Fluttertoast.showToast(
                                      msg: e.message!,
                                      gravity: ToastGravity.CENTER);
                                }
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
