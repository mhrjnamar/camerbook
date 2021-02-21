import 'package:camerbook/auth/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

bool isLoading1= true;

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Register"),
        ),
        body: Column(children: [
          Center(
            child: Image.asset("assets/logo.png"),
          ),
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
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Email",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter your Email";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: "Password",
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter password";
                        }
                        return null;
                      },
                    ),
                    Padding(
                        padding: EdgeInsets.all(0),
                        child: isLoading1
                            ? ElevatedButton(
                            child: Text("Register"),
                            onPressed: () async
                            {
                              setState(() {
                                isLoading1 = false;
                              });

                              if (_formKey.currentState.validate()) {
                                dynamic results = await context.read<
                                    AuthenticationService>().signUp(
                                  email: emailController.text,
                                  password: passwordController.text,
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
                              }
                                setState(() {
                                  isLoading1 = true;
                                });

                            }
                                ): Center(child: CircularProgressIndicator())
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    Text("Already a user?"),
                    TextButton(
                      child: Text("Go to login"),
                      onPressed: () => {Navigator.pop(context)},
                    ),
                  ],
                ),
              ))
        ]));
  }
}
