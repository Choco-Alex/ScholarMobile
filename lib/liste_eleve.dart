import 'package:flutter/material.dart';
import 'package:scholar/account.dart';
import 'package:scholar/drawer.dart';

class Liste_Eleve extends StatefulWidget {
  const Liste_Eleve({super.key});

  @override
  State<Liste_Eleve> createState() => _Liste_EleveState();
}

class _Liste_EleveState extends State<Liste_Eleve> {
  String? dropdownValue;

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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.black,
                Colors.indigo,
                Colors.black,
              ],
            ),
          ),
          child: Column(
            children: [
              Text(
                "Consulter la liste des élèves.",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Selectionner la salle de classe",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white54,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              dropdownButton(),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.indigo,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Consulter",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                onPressed: () {},
              ),
              SizedBox(
                height: 20,
              ),
              Table(
                border: TableBorder.all(width: 0.5, color: Colors.white),
                children: [
                  TableRow(children: [
                    TableCell(
                      child: Row(
                        children: <Widget>[
                          new Text(
                            'ID',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          new Text(
                            'Nom Complet',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    TableCell(
                      child: Row(
                        children: <Widget>[
                          new Text(
                            '1',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          new Text(
                            'KOM TAGNE Alex Brondon',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ])
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget dropdownButton() {
    return DropdownButtonFormField<String>(
        style: TextStyle(color: Colors.white),
        iconEnabledColor: Colors.white,
        dropdownColor: Colors.black,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
        hint: const Text(
          "Selectionner la salle de classe",
          style: TextStyle(color: Colors.white),
        ),
        value: dropdownValue,
        items: <String>[
          '6eme M1',
          '6eme M2',
          '5eme M1',
          '5eme M2',
          '4eme Esp',
          '4eme All',
          '3eme Esp',
          '3eme All',
          '2nd A Esp',
          '2nd A All',
          '2nd C',
          '1ere A Esp',
          '1ere A All',
          '1ere C',
          '1ere D1',
          '1ere D2',
          'Tle A Esp',
          'Tle A All',
          'Tle C',
          'Tle D1',
          'Tle D2'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        });
  }
}
