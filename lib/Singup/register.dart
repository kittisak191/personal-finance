import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Box/profile.dart';
import 'package:flutter_application_1/Singup/account.dart';
import 'package:flutter_application_1/homescreen/Secondscreen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Registerscreen extends StatefulWidget {
  const Registerscreen({Key? key}) : super(key: key);

  @override
  _RegisterscreenState createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  final formKey = GlobalKey<FormState>();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  Profile profile = Profile(email: '', password: '');

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
                  style: TextStyle(fontSize: 45, fontFamily: 'Nongnew'),
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
                  "create Account",
                  style: TextStyle(
                  fontSize: 45, 
                  fontFamily: 'Nongnew'),
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
                              "Register",
                              style: TextStyle(
                                fontSize: 45, 
                                fontFamily: 'Nongnew'),
                            ),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                try {
                                  await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                          email: profile.email,
                                          password: profile.password)
                                      .then((value) {});
                                  formKey.currentState!.reset();
                                  Fluttertoast.showToast(
                                      msg: "User account has been created.",
                                      gravity: ToastGravity.TOP);
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Account();
                                  }));
                                } on FirebaseAuthException catch (e) {
                                  print(e.code);
                                  String message;
                                  if (e.code == 'Email-already-in-use') {
                                    message =
                                        "This Email is already in the system. Please use a different Email.";
                                  } else if (e.code == 'weak-Password') {
                                    message =
                                        "Password must be at least 6 characters long.";
                                  } else {
                                    message = e.message!;
                                  }
                                  Fluttertoast.showToast(
                                    msg: message,
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
