import 'package:flutter/material.dart';
import 'package:scholar/login.dart';

class started extends StatefulWidget {
  const started({super.key});

  @override
  State<started> createState() => _startedState();
}

class _startedState extends State<started> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 15),
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
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30),
              height: 200,
              width: 200,
              decoration: BoxDecoration(),
              child: Image.asset("assets/images/logo.png"),
            ),
            Text(
              "Bienvenue Chez Scholar",
              style: TextStyle(
                color: Color.fromARGB(255, 85, 233, 90),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Une application de toute nouvelle génération adapté aux réalités sur le terrain qui vous permet de payer les frais de scolarité en toute simplicité et ce, depuis votre téléphone portable.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                letterSpacing: 1.5,
                height: 1.5,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Facile, Rapide et Partout",
              style: TextStyle(
                color: Color.fromARGB(255, 85, 233, 90),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            Stack(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(250, 50),
                    foregroundColor: Colors.red,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(35)),
                    ),
                  ),
                  child: Text(
                    "Commencer",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
                  },
                ),
                Positioned(
                  right: 30,
                  top: 8,
                  child: InkWell(
                    child: Icon(
                      Icons.arrow_circle_right_outlined,
                      color: Colors.red,
                      size: 35,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Container(
                    height: 155,
                    width: 155,
                    decoration: BoxDecoration(),
                    child: Image.asset("assets/images/clip-school-bus.png"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 155,
                    width: 155,
                    decoration: BoxDecoration(),
                    child: Image.asset("assets/images/clip-school.png"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
