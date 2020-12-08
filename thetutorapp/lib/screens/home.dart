import 'package:flutter/material.dart';
import 'package:thetutorapp/services/authentification/onboard.dart';
import 'package:thetutorapp/services/shared_widgets/navigation_bar.dart';
import 'content/tutor_peer_list.dart';

class Home extends StatelessWidget {
  Home({this.uid});
  final String uid;
  final String title = "Home";

  final signedInMessage = Column(
    children: <Widget>[
      Padding(padding: EdgeInsets.only(top: 30.0)),
      Text(
        'Explore Tutor App',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    final logo = Image.asset(
      "assets/images/emirates.png",
      fit: BoxFit.fill,
      width: 90.0,
      height: 90.0,
    );

    return Scaffold(
        appBar: AppBar(
          title: Text(title),

        ),
        body: SchoolList(),
        drawer: NavigateDrawer(uid: this.uid));
  }
}

