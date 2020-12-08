import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thetutorapp/screens/home.dart';



class EmailLogIn extends StatefulWidget {
  @override
  _EmailLogInState createState() => _EmailLogInState();
}

class _EmailLogInState extends State<EmailLogIn> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final logo = Image.asset(
      "assets/images/emirates.png",
      fit: BoxFit.fill,
      width: 80.0,
      height: 80.0,
    );

    final welcomeImg = Image.asset(
      "assets/welcome.png",
      fit: BoxFit.fill,
      height: 120.0,
      width: 102.0,
    );
    

    final welcomeMsg = Column(
      children: <Widget>[
        Text(
          'Welcome Back to Tutor App',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
      ],
    );

    return Scaffold(
        backgroundColor: Color(0xFFE1F5FE),
        appBar: AppBar(title: Text("Login to Tutor App")),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 40)),
                    logo,
                    Padding(padding: EdgeInsets.only(top: 30)),
                    welcomeMsg,
                    Padding(padding: EdgeInsets.only(bottom: 30)),
                    welcomeImg,
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Email Address",
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Mandatory Field, Enter Your Email Address';
                          } else if (!value.contains('@')) {
                            return 'Please enter a valid email address!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: TextFormField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: "Password",
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Mandatory Field, Enter Your Password';
                          } else if (value.length < 8) {
                            return 'Password must be atleast 8 characters!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: isLoading
                          ? CircularProgressIndicator()
                          : RaisedButton(
                              color: Colors.lightBlue,
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  logInToFb();
                                }
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                    )
            ]))));
  }

  void logInToFb() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((result) {
      isLoading = false;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home(uid: result.user.uid)),
      );
    }).catchError((err) {
      print(err.message);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(err.message),
              actions: [
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
  }
}
