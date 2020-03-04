import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mypractice/screens/signup_page.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey= GlobalKey<FormState>();
  String _email, _password;
  bool  _isChecked= false;

  void _submit(){
    if(_formkey.currentState.validate()){
      _formkey.currentState.save();
      print('Email');
      print('Password');
    }
  }
  void onChanged(bool value){
    setState(() {
       _isChecked = value;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: 190,
              height: 190,
              color: Colors.blue,
              child: Padding(
                padding: EdgeInsets.only(top: 50, left: 40),
                child: Text(
                  'Login and you can discover best news around the world',

                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              ),
            SizedBox(
              height: 90.0,
            ),
            Form(
              key: _formkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Email", labelStyle: TextStyle(fontFamily: 'AdventPro'),
                        hintText: 'Enter Email',
                        hintStyle: TextStyle(color: Colors.grey, fontFamily: 'AdventPro'),
                        fillColor: Colors.white,

                      ),
                      keyboardType: TextInputType.multiline,
                      validator: (input)=> !input.contains('@') ? 'Please a enter valid email': null,
                      onSaved: (input)=>_email = input,

                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Password(optional)", labelStyle: TextStyle(fontFamily: 'AdventPro'),
                        hintText: 'Enter password',
                        hintStyle: TextStyle(color: Colors.grey,fontFamily:'AdventPro'),
                      ),
                      keyboardType: TextInputType.multiline,
                      validator: (input)=> input.length < 6 ? 'Must be atlest six characterss' : null,
                      onSaved: (input)=>_password = input,
                      obscureText: true,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 250.0),
                    child: Checkbox(
                        value: _isChecked,
                        onChanged:(bool value){
                          onChanged(value);
                        }
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    width: 300,
                    child: FlatButton(
                        onPressed: (){
                          _submit();
                          Navigator.pushReplacementNamed(context, SignupPage.id);
                        },
                        color: Colors.pinkAccent[200],
                        padding: EdgeInsets.all(12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontFamily: 'Rajdhani',
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
