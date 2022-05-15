import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_complete_guide/screens/TabScreen.dart';

enum AuthMode {
  Login,
  Signup,
}

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.red, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        height: size - MediaQuery
            .of(context)
            .padding
            .bottom,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white38,
                border: Border.all(color: Colors.black, width: 0.5)
              ),
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(5),
              child: Text(
                "SHOP DEMO",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5),
              ),
            ),
            SizedBox(height: 15),
            AuthCard(formKey: _formKey),
          ],
        ),
      ),
    );
  }
}

class AuthCard extends StatefulWidget {
  const AuthCard({
    Key key,
    @required GlobalKey<FormState> formKey,
  })
      : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  State<AuthCard> createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  AuthMode _currentMode = AuthMode.Login;

  void _modeSwitcher() {
    if (_currentMode == AuthMode.Login) {
      _currentMode = AuthMode.Signup;
    } else {
      _currentMode = AuthMode.Login;
    }
  }

  void _submit() {
    widget._formKey.currentState.validate();
  }

  TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      elevation: 5,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        height: _currentMode.name == 'Login' ? 300 : 381,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: widget._formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: "Email"),
                    keyboardType: TextInputType.emailAddress,
                    validator: (inputText) {
                      if (inputText.isEmpty) {
                        return "Enter email address";
                      }
                      if (!inputText.contains('@')) {
                        return "Enter a valid address.";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Password"),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    controller: _passwordController,
                    validator: (inputText) {
                      if (inputText.isEmpty) {
                        return "Enter password.";
                      }
                      if (inputText.length < 8) {
                        return "Minimum length is 8";
                      }
                      return null;
                    },
                  ),
                  if (_currentMode.name != 'Login')
                    TextFormField(
                      decoration:
                      InputDecoration(labelText: "Confirm Password"),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      validator: (inputText) {
                        if (inputText.isEmpty) {
                          return "Enter password.";
                        }
                        if (inputText != _passwordController.text) {
                          return "Enter correct password";
                        }
                        return null;
                      },
                    ),
                ],
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                _submit();
                //Navigator.of(context).pushNamed(TabScreen.routeName);
              },
              child: Text("${_currentMode.name}"),
            ),
            SizedBox(height: 5),
            TextButton(
              onPressed: () => setState(_modeSwitcher),
              child: Text(
                (_currentMode.name == 'Login')
                    ? "SIGNUP INSTEAD"
                    : "LOGIN INSTEAD",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
