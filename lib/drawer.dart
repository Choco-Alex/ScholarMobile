import 'package:flutter/material.dart';
import 'package:scholar/account.dart';
import 'package:scholar/accueil.dart';
import 'package:scholar/liste_eleve.dart';
import 'package:scholar/login.dart';
import 'package:scholar/modifier_eleve.dart';
import 'package:scholar/new_student.dart';
import 'package:scholar/payment.dart';
import 'package:scholar/request.dart';
import 'package:scholar/school.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: DrawerHeader(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              gradient: LinearGradient(
                colors: [
                  Colors.indigo,
                  Colors.black,
                ],
              ),
            ),
            child: ListView(
              children: <Widget>[
                Container(
                  height: 130,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/log.png"),
                    ),
                  ),
                ),
                const Divider(),
                ListTile(
                  title: Text('Home'),
                  textColor: Colors.white,
                  leading: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Accueil())),
                ),
                ListTile(
                  title: Text('School'),
                  textColor: Colors.white,
                  leading: Icon(
                    Icons.school,
                    color: Colors.white,
                  ),
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => School())),
                ),
                ListTile(
                  title: Text('Payment'),
                  textColor: Colors.white,
                  leading: Icon(
                    Icons.payment,
                    color: Colors.white,
                  ),
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Payment())),
                ),
                ListTile(
                  title: Text('New Student'),
                  textColor: Colors.white,
                  leading: Icon(
                    Icons.person_add,
                    color: Colors.white,
                  ),
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => NewStudent())),
                ),
                ListTile(
                  title: Text('Liste des élèves'),
                  textColor: Colors.white,
                  leading: Icon(
                    Icons.list_alt_outlined,
                    color: Colors.white,
                  ),
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Liste_Eleve())),
                ),
                ListTile(
                  title: Text('Modifier Elève ?'),
                  textColor: Colors.white,
                  leading: Icon(
                    Icons.mode,
                    color: Colors.white,
                  ),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>const ModifierEleve())),
                ),
                ListTile(
                  title: Text('Request'),
                  textColor: Colors.white,
                  leading: Icon(
                    Icons.message,
                    color: Colors.white,
                  ),
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Request())),
                ),
                ListTile(
                  title: Text('About'),
                  textColor: Colors.white,
                  leading: Icon(
                    Icons.info_rounded,
                    color: Colors.white,
                  ),
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => School())),
                ),
                ListTile(
                  title: Text('My Account'),
                  textColor: Colors.white,
                  leading: Icon(
                    Icons.account_box,
                    color: Colors.white,
                  ),
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Account())),
                ),
                ListTile(
                  title: Text('Log out'),
                  textColor: Colors.white,
                  leading: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Login())),
                ),
              ],
            )));
  }
}
