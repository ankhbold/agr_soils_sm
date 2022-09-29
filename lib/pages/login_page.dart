
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:agr_soils/common/theme_helper.dart';

import '../common/theme_helper.dart';
import 'forgot_password_page.dart';
import 'profile_page.dart';
import 'main_page.dart';
import 'registration_page.dart';
import 'widgets/header_widget.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}): super(key:key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  double _headerHeight = 250;
  Key _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              // child: HeaderWidget(_headerHeight, true, Icons.login_rounded), //let's create a common header widget
              child: Image(image: AssetImage('/images/agr_logo.png')),
            ),
            SafeArea(
              child: Container( 
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),// This will be the login form
                child: Column(
                  children: [
                    Text(
                      'Ухаалаг газар тариалан',
                      style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Та бүртгэлдээ нэвтрэнэ үү',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 30.0),
                    Form(
                      key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              child: TextField(
                                decoration: ThemeHelper().textInputDecoration('Хэрэглэгчийн нэр', 'Нэвтрэх нэр оруулна уу!'),
                              ),
                              decoration: ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 30.0),
                            Container(
                              child: TextField(
                                obscureText: true,
                                decoration: ThemeHelper().textInputDecoration('Нууц үг', 'Нууц үг оруулна уу!'),
                              ),
                              decoration: ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 15.0),
                            Container(
                              margin: EdgeInsets.fromLTRB(10,0,10,20),
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push( context, MaterialPageRoute( builder: (context) => ForgotPasswordPage()), );
                                },
                                child: Text( "Нууц үг мартсан?", style: TextStyle( color: Colors.grey, ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: Text('Нэвтрэх'.toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                                ),
                                // onPressed: (){
                                //   //After successful login we will redirect to profile page. Let's create profile page now
                                //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                                // },
                                onPressed: (){
                                  //After successful login we will redirect to profile page. Let's create profile page now
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(10,20,10,20),
                              //child: Text('Don\'t have an account? Create'),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(text: "Танд бүртгэл байгаа юу? "),
                                    TextSpan(
                                      text: 'Бүртгэл үүсгэх',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                                        },
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).accentColor),
                                    ),
                                  ]
                                )
                              ),
                            ),
                          ],
                        )
                    ),
                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );

  }
}