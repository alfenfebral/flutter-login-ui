import 'package:flutter/material.dart';
import 'home_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
  };

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Login UI',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Nunito"
      ),
      home: new LoginPage(),
      routes: routes,
    );
  }
}

class LoginPage extends StatefulWidget {
  static String tag = "login-page";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

    final logo = Hero(
      tag: "hero",
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: "alfenfebral@gmail.com",
      decoration: InputDecoration(
        hintText: "Email",
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0)
        ),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      initialValue: "some password",
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Password",
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0)
        ),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          color: Colors.lightBlueAccent,
          child: Text("Login", style: TextStyle(color: Colors.white)),
          onPressed: () {
            Navigator.of(context).pushNamed(HomePage.tag);
          },
        ),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        "Forgot Password",
        style: TextStyle(color: Colors.black)
      ),
      onPressed: (){},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 48.0),
            password,
            SizedBox(height: 48.0),
            loginButton,
            forgotLabel
          ],
        ),
      )
    );
  }
}
