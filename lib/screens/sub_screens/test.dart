import 'package:camerbook/auth/authentication_service.dart';
import 'package:camerbook/backend/Read.dart';
import 'package:camerbook/backend/backend.dart';
import 'package:camerbook/backend/firebase.dart';
import 'package:camerbook/model/ProfessionModel.dart';
import 'package:camerbook/model/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
bool isLoading= true;
bool isLoading1= true;
class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController profession = TextEditingController();
  final TextEditingController contact = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Column(children: [

          Padding(
              padding: EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: "Name",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter your name";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: contact,
                      decoration: InputDecoration(
                        hintText: "Contact no.",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter contact";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: description,
                      decoration: InputDecoration(
                        hintText: "Description",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter short descriptions";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: profession,
                      decoration: InputDecoration(
                        hintText: "Profession",
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter profession";
                        }
                        return null;
                      },
                    ),
                    Padding(
                        padding: EdgeInsets.all(0),
                        child: isLoading
                            ? ElevatedButton(
                            child: Text("Add Professional"),
                            onPressed: () async
                            {
                              setState(() {
                                isLoading = false;
                              });

                              if (_formKey.currentState.validate()) {
                                dynamic results = await context.
                                read<Backend>().addProfessional(
                                  new ProfessionModel(name: nameController.text,profession: profession.text ,description: [description.text])
                                );

                                if (results != null) {
                                  showDialog<void>(
                                    context: context,
                                    barrierDismissible: false,
                                    // user must tap button!
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Error'),
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: <Widget>[
                                              Text(results),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text('Done'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                                setState(() {
                                  isLoading = true;
                                });
                              }
                            }
                        ): Center(child: CircularProgressIndicator())
                    ),
                    Padding(
                        padding: EdgeInsets.all(0),
                        child: isLoading
                            ? ElevatedButton(
                            child: Text("Add User"),
                            onPressed: () async
                            {
                              setState(() {
                                isLoading1 = false;
                              });

                              if (_formKey.currentState.validate()) {
                                String data = readUserId();
                                dynamic results = await context.
                                read<Backend>().addUser(
                                    new UserModel(uid:data,name: nameController.text,profession: profession.text,contact: contact.text ,description: [description.text])
                                );

                                if (results != null) {
                                  showDialog<void>(
                                    context: context,
                                    barrierDismissible: false,
                                    // user must tap button!
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Error'),
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: <Widget>[
                                              Text(results),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text('Done'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                                setState(() {
                                  isLoading1 = true;
                                });
                              }
                            }
                        ): Center(child: CircularProgressIndicator())
                    ),
                    Padding(padding: EdgeInsets.all(8)),

                  ],
                ),
              ))
        ]));
  }
}
