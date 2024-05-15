import 'package:flutter/material.dart';
import 'package:scholar/account.dart';
import 'package:scholar/drawer.dart';

class School extends StatefulWidget {
  const School({super.key});

  @override
  State<School> createState() => _SchoolState();
}

class _SchoolState extends State<School> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          InkWell(
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Account())),
              child: Icon(Icons.account_circle)),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      drawer: NavDrawer(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.white,
              Colors.black,
              Colors.indigo,
            ],
          ),
        ),
      ),
    );
  }
}
