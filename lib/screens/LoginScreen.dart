import 'package:camerbook/auth/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
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
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "Username",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please enter username";
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
                            return "Please enter username";
                          }
                          return null;
                        },
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          child: Text("Forgot Password?"),
                          onPressed: () => {},
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(0),
                          child: ElevatedButton(
                              child: Text("Login"),
                              onPressed: () async {
                                if (_formKey.currentState.validate())
                                  {
                                    dynamic results =
                                    await context
                                        .read<AuthenticationService>()
                                        .signIn(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );

                                    if(results != null)
                                      {
                                        showDialog<void>(
                                          context: context,
                                          barrierDismissible: false, // user must tap button!
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
                              })),
                      Padding(padding: EdgeInsets.all(8)),
                      Text("Not a member yet?"),
                      TextButton(
                        child: Text("Register now"),
                        onPressed: () => {},
                      ),
                    ],
                  ),
                ))
          ]),
        ),



        );
  }
}
