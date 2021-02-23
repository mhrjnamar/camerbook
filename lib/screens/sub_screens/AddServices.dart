import 'package:camerbook/backend/backend.dart';
import 'package:camerbook/model/ServiceModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddServices extends StatelessWidget {
  final TextEditingController name = TextEditingController();
  final TextEditingController imgUrl = TextEditingController();
  final TextEditingController details = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Form(
          key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(16),
      child: Column(
        children: [
          textfield('Name of Service', name),

          textfield('Image of Service', imgUrl),

          textfield('Details of Service', details),

          ElevatedButton(
              child: Text("Add Services"),
              onPressed: () async
              {

                if (_formKey.currentState.validate()) {
                  dynamic results = await context.
                  read<Backend>().addService(
                      new ServiceModel(name: name.text,url: imgUrl.text, description: [details.text])
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
                  else{
                    showDialog<void>(
                      context: context,
                      barrierDismissible: false,
                      // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Success'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text('Services has been successfully added'),
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
              }
          )
        ],
      ),
    )));
  }
}

textfield(String id, controller) {
  return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: id.toString()),
      validator: (value) {
    if (value.isEmpty) {
      return "Please enter field";
    }
    return null;
  },
  );
}
