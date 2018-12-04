import 'package:flutter/material.dart';

import '../mixins/validation_mixin.dart';

// Creates state
class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

// Holds state and make ValidationMixins available
class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  // Stores FormState in GlobalKey
  final formKey = GlobalKey<FormState>();

  // Save form values
  String email = '';
  String password = '';

  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          // Helper methods to make this more readable...
          children: [
            emailField(),
            passwordField(),
            // Better to insert margin here than in a widget and easier to refactor
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  // Helper methods for readability
  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: 'Enter email address.', hintText: 'you@example.com'),
      validator: validateEmail,
      onSaved: (String value) {
        email = value;
        print(value);
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: false, // For password privacy, bool is eqaul to 'true'
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Password',
      ),
      validator: validatePassword,
      onSaved: (String value) {
        password = value;
        print(value);
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.blue,
      child: Text('Submit'), // Button text is brought in by child
      onPressed: () {
        // Runs validate() to check current state with form fields through validator() then saves state if true
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('Time to post $email and $password to API');
        }
        // formKey.currentState.reset(); // Manages current form state!
      }, // Required and needs a callback function
    );
  }
}
