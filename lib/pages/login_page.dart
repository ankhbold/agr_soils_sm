import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:agr_soils/common/theme_helper.dart';

import 'package:agr_soils/domain/user.dart';
import 'package:agr_soils/providers/auth.dart';
import 'package:agr_soils/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../common/theme_helper.dart';
import 'forgot_password_page.dart';
import 'profile_page.dart';
import 'main_page.dart';
import 'registration_page.dart';
import 'widgets/header_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  double _headerHeight = 250;
  Key _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // AuthProvider auth = Provider.of<AuthProvider>(context);
    AuthProvider auth = new AuthProvider();
    UserProvider userP = new UserProvider();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              // child: HeaderWidget(_headerHeight, true, Icons.login_rounded), //let's create a common header widget
              child: Image(image: AssetImage('assets/images/agr_logo.png')),
            ),
            SafeArea(
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(
                      20, 10, 20, 10), // This will be the login form
                  child: Column(
                    children: [
                      Text(
                        'Ухаалаг газар тариалан',
                        style: TextStyle(
                            fontSize: 45, fontWeight: FontWeight.bold),
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
                                  controller: usernameController,
                                  decoration: ThemeHelper().textInputDecoration(
                                      'Хэрэглэгчийн нэр',
                                      'Нэвтрэх нэр оруулна уу!'),
                                ),
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 30.0),
                              Container(
                                child: TextField(
                                  obscureText: true,
                                  controller: passwordController,
                                  decoration: ThemeHelper().textInputDecoration(
                                      'Нууц үг', 'Нууц үг оруулна уу!'),
                                ),
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 15.0),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPasswordPage()),
                                    );
                                  },
                                  child: Text(
                                    "Нууц үг мартсан?",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: Text(
                                      'Нэвтрэх'.toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  // onPressed: (){
                                  //   //After successful login we will redirect to profile page. Let's create profile page now
                                  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                                  // },
                                  onPressed: () {
                                    //After successful login we will redirect to profile page. Let's create profile page now
                                    // showDialog(
                                    //   context: context,
                                    //   builder: (ctx) => AlertDialog(
                                    //     title: const Text("Alert Dialog Box"),
                                    //     content: const Text("You have raised a Alert Dialog Box"),
                                    //     actions: <Widget>[
                                    //       TextButton(
                                    //         onPressed: () {
                                    //           Navigator.of(ctx).pop();
                                    //         },
                                    //         child: Container(
                                    //           color: Colors.green,
                                    //           padding: const EdgeInsets.all(14),
                                    //           child: const Text("okay"),
                                    //         ),
                                    //       ),
                                    //     ],
                                    //   ),
                                    // );
                                    final Future<Map<String, dynamic>>
                                        successfulMessage = auth.login(
                                            usernameController.text.toString(),
                                            passwordController.text.toString());
                                    successfulMessage.then((response) {
                                      print(response['status']);
                                      if (response['status']) {
                                        User user = response['user'];
                                        print(user.username);
                                        // Provider.of<UserProvider>(context,
                                        //         listen: false)
                                        //     .setUser(user);

                                        userP.setUser(user);

                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MainPage()));
                                      }
                                    });

                                    // Navigator.pushReplacement(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             MainPage()));
                                    // final Future<Map<String, dynamic>>
                                    //     successfulMessage = login(
                                    //         usernameController.text.toString(),
                                    //         passwordController.text.toString());
                                  },
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                //child: Text('Don\'t have an account? Create'),
                                child: Text.rich(TextSpan(children: [
                                  TextSpan(text: "Танд бүртгэл байгаа юу? "),
                                  TextSpan(
                                    text: 'Бүртгэл үүсгэх',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RegistrationPage()));
                                      },
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).accentColor),
                                  ),
                                ])),
                              ),
                            ],
                          )),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  // Future<Map<String, dynamic>> login(String username, String password) async {
  //   var result;

  //   final Map<String, dynamic> loginData = {
  //     'user': {'username': username, 'password': password}
  //   };

  // _loggedInStatus = Status.Authenticating;
  // notifyListeners();

  // Response response = await post(
  //   "http://103.143.40.250:8100/login/mobile",
  //   body: json.encode(loginData),
  //   headers: {'Content-Type': 'application/json'},
  // );

  // Response response = await post(
  //     Uri.parse('http://103.143.40.250:8100/login/mobile'),
  //     body: {'username': username, 'password': password});

  // result = {'status': true, 'statusCode': 200};
  // print(result);
  // if (response.statusCode == 200) {
  //   final Map<String, dynamic> responseData = json.decode(response.body);

  //   var userData = responseData['data'];

  //   User authUser = User.fromJson(userData);

  //   UserPreferences().saveUser(authUser);

  //   _loggedInStatus = Status.LoggedIn;
  //   notifyListeners();

  //   result = {'status': true, 'message': 'Successful', 'user': authUser};
  // } else {
  //   _loggedInStatus = Status.NotLoggedIn;
  //   notifyListeners();
  //   result = {
  //     'status': false,
  //     'message': json.decode(response.body)['error']
  //   };
  // }
  // return result;

  // Future<Map<String, dynamic>> login(String username, String password) async {
  //   var result;
  //
  //   try {
  //     Response response = await post(
  //         Uri.parse('http://103.143.40.250:8100/login/mobile'),
  //         body: {'username': username, 'password': password});
  //     // print(response.statusCode);
  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body.toString());
  //       // print(data);
  //       print(data['status']);
  //       // print(data['data']);
  //       if (data['status'] == true) {
  //         result = {'status': true, 'message': 'Successful'};
  //       }
  //       // print('Login successfully');
  //     } else {
  //       print('failed');
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   return result;
  // }
}



  // void login(String username , password) async {
  //   var client = http.Client();
  //   // String uri = "https://jsonplaceholder.typicode.com/users";
  //   String uri = "http://103.143.40.250:8100/login/mobile";
  //   var response = await client.get(Uri.parse(uri));
  //   print(response.statusCode);
  //
  //
  //   if (response.statusCode == 200) {
  //     // return jsonModelFromJson(response.body);
  //   } else {
  //     throw Exception("falied to load");
  //   }
  // }

