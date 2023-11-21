import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //to uniquely identify the form and allow for validation
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  //global reference for the Scaffold Messenger to display snackbars

  final TextEditingController emailcontroller = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    emailcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _scaffoldKey, //to be able to show the snackbar
      home: Scaffold(
        body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Expanded(flex: 1, child: TextFormField()),
              Expanded(flex: 1, child: TextFormField()),
              Expanded(flex: 1, child: TextFormField()),
              Padding(
                padding: EdgeInsets.all(60),
                child: ElevatedButton(
                  child: Text('Save'),
                  onPressed: () {
                    FormState? fs = _formKey.currentState;
                    if (fs!.validate()) {
                      //this will call the validator in each TextFormField()
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      //ScaffoldMessenger.of(context) - if there is a parent ScaffoldMessenger
                      _scaffoldKey.currentState!.showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Sure. Save this garbage? Not.',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      );
                    } else {
                      //not valid...
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
TextField(
  keyboardType: TextInputType.text,
  //text, multiline, number, phone, datetime, emailAddress, url, visiblePassword, 
  //name, streetAddress, none
  maxLength: 80,
  enabled: true, //like HTML disabled: false
  obscureText: false, //for passwords
  readOnly: false,
  style: TextStyle(color: Colors.blue),
  decoration: InputDecoration( 
    labelText: 'First Name' 
    icon: Icon(Icons.person),
    hintText: 'What do people call you?',  
  ),
  textInputAction: TextInputAction.next,
  // done, go, join, newline, next, previous, search, send, emergencyCall
  controller: _controller, //a TextEditingController()
  //controller.text is the current value in this controller
  onSubmitted: (String value) {
    print('You have typed $value');
    //just like controller.text
    //you could call setState here
  },
  onChanged: (String value) {
    print('You have typed $value');
    //just like controller.text
    //you could call setState here
  },
)
TextFormField(
  //inherits all the TextField stuff
  validator: (String? value) {
    //triggered by the Form
    return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
  },
)
Form(

)
*/