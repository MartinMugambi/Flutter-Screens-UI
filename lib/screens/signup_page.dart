import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SignupPage extends StatefulWidget {
  static final String id = "SignupPage";
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formkey= GlobalKey<FormState>();
  String _email, _password, _name;
  void _submit(){
    if(_formkey.currentState.validate()){
      _formkey.currentState.save();
      print('Email');
      print('Password');
    }
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
                  'Sign Up and you can discover best news around the world',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
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
                        labelText: "Names", labelStyle: TextStyle(fontFamily: 'AdventPro'),
                        hintText: 'Enter Name',
                        hintStyle: TextStyle(color: Colors.grey, fontFamily: 'AdventPro'),
                        fillColor: Colors.white,
                      ),
                      keyboardType: TextInputType.multiline,
                      validator: (input)=> input.isEmpty ?'Enter a name': null,
                      onSaved: (input)=>_email = input,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Email", labelStyle: TextStyle(fontFamily: 'AdventPro'),
                        hintText: 'Enter email',
                        hintStyle: TextStyle(color: Colors.grey,fontFamily:'AdventPro'),
                      ),
                      keyboardType: TextInputType.multiline,
                      validator: (input)=> input.length < 6 ? 'Must be atlest six characterss' : null,
                      onSaved: (input)=>_password = input,
                      obscureText: true,
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
                    height: 15.0,
                  ),
                  Container(
                    width: 300,
                    child: FlatButton(
                        onPressed: (){
                          _submit();
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
