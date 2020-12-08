import 'package:flutter/material.dart';
import 'package:thetutorapp/services/shared_widgets/navigation_bar.dart';
import 'package:thetutorapp/services/shared_widgets/network_image.dart';

import '../home.dart';


class user_profile_page extends StatefulWidget {
  user_profile_page( { uid, this.userid});
  final String userid;

  @override
  _user_profile_pageState createState() => _user_profile_pageState();
}

class _user_profile_pageState extends State<user_profile_page> {

  final image = "https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F4.jpg?alt=media";
  final image2 = "https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F1.jpg?alt=media";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Back"),
        actions:<Widget>[
          IconButton(
            icon: Icon(
                Icons.arrow_back,
              color: Colors.black54,
            ),
            onPressed: ( ){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home(uid: widget.userid)),
              );
            },
          )
        ],
      ),
      backgroundColor: Colors.black54,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: 250,
              width: double.infinity,
              child: PNetworkImage(
                image2,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16.0, 200.0, 16.0, 16.0),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(16.0),
                        margin: EdgeInsets.only(top: 16.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 96.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Little Butterfly",
                                    style: Theme.of(context).textTheme.title,
                                  ),
                                  ListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    title: Text("Product Designer"),
                                    subtitle: Text("Kathmandu"),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Row(
                              children: <Widget>[
                                // Expanded(
                                //   child: Column(
                                //     children: <Widget>[
                                //       Text("285"),
                                //       Text("Likes")
                                //     ],
                                //   ),
                                // ),
                                // Expanded(
                                //   child: Column(
                                //     children: <Widget>[
                                //       Text("3025"),
                                //       Text("Comments")
                                //     ],
                                //   ),
                                // ),
                                // Expanded(
                                //   child: Column(
                                //     children: <Widget>[
                                //       Text("650"),
                                //       Text("Favourites")
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: NetworkImage(image), fit: BoxFit.cover)),
                        margin: EdgeInsets.only(left: 16.0),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text("Bio"),
                        ),
                        Divider(),
                        ListTile(
                          title: Text("Email"),
                          subtitle: Text("butterfly.little@gmail.com"),
                          leading: Icon(Icons.email),
                        ),
                        Divider(),

                        ListTile(
                          title: Text("Phone"),
                          subtitle: Text("+977-9815225566"),
                          leading: Icon(Icons.phone),
                        ),
                        Divider(),
                        ListTile(
                          title: Text("Location"),
                          subtitle: Text("Kigai, Rwanda "),
                          trailing: Text("1.4 kilometers Away"),
                          leading: Icon(Icons.location_pin),
                        ),
                        Divider(),
                        ListTile(
                          title: Text("School"),
                          subtitle: Text("African Leadership University"),
                          leading: Icon(Icons.school_rounded),
                        ),
                        Divider(),

                        ListTile(
                          title: Text("About"),
                          subtitle: Text(
                              "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nulla, illo repellendus quas beatae reprehenderit nemo, debitis explicabo officiis sit aut obcaecati iusto porro? Exercitationem illum consequuntur magnam eveniet delectus ab."),
                          leading: Icon(Icons.person),
                        ),
                        Divider(),

                        ListTile(
                          title: Text("Subjects"),
                          subtitle: Text(
                              "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nulla, illo repellendus quas beatae reprehenderit nemo, debitis explicabo officiis sit aut obcaecati iusto porro? Exercitationem illum consequuntur magnam eveniet delectus ab."),
                          leading: Icon(Icons.class__outlined),
                        ),
                        Divider(),

                        ListTile(
                          title: Text("Joined Date"),
                          subtitle: Text("15 February 2019"),
                          leading: Icon(Icons.calendar_view_day),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
     //drawer: NavigateDrawer(uid: widget.userid),
    );
  }
}


