import 'package:flutter/material.dart';

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
                          return "Please enter password";
                        }
                        return null;
                      },
                    ),
                    Padding(
                        padding: EdgeInsets.all(0),
                        child: ElevatedButton(
                            child: Text("Register"),
                            onPressed: () =>
                                {if (_formKey.currentState.validate()) {}})),
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
