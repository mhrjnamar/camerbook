import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        children: [
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
                    decoration: InputDecoration(
                      hintText: "Username",
                    ),
                    validator: (value) {
                      if(value.isEmpty){
                        return "Please enter username";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Password",
                    ),
                    obscureText: true,
                    validator: (value) {
                      if(value.isEmpty){
                        return "Please enter username";
                      }
                      return null;
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight ,
                    child: TextButton(
                      child: Text("Forgot Password?"),
                      onPressed: () => {

                      },
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(0),
                    child: ElevatedButton(
                        child: Text("Login"),
                        onPressed:() => {
                          if (_formKey.currentState.validate()){
                            ScaffoldMessenger
                                .of(context)
                                .showSnackBar(SnackBar(content: Text("Processing Data")))
                          }
                        }
                    )
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  Text("Not a member yet?"),
                  TextButton(
                    child: Text("Register now"),
                    onPressed: () => {

                    },
                  ),

                ],
              ),
            )
          )
        ]
      )

    );
  }
}
