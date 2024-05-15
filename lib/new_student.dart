import 'package:flutter/material.dart';
import 'package:scholar/account.dart';
import 'package:scholar/drawer.dart';

import 'package:date_field/date_field.dart';

class NewStudent extends StatefulWidget {
  const NewStudent({super.key});

  @override
  State<NewStudent> createState() => _NewStudentState();
}

class _NewStudentState extends State<NewStudent> {
  String? gender = "Male";
  String? dropdownValue;
  DateTime? selectedDate;
  final _formkey = GlobalKey<FormState>();
  String? msg;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          InkWell(
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Account())),
              child: const Icon(Icons.account_circle)),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      drawer: NavDrawer(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        decoration: const BoxDecoration(
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
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Enregistrer un nouveau élève",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                labelTitle("Nom Complet :"),
                const SizedBox(
                  height: 10,
                ),
                label("Veuillez entrer un nom valide"),
                const SizedBox(
                  height: 10,
                ),
                labelTitle("Date de Naissance :"),
                const SizedBox(
                  height: 10,
                ),
                DateTimeField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    iconColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelText: 'Enter Date',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  value: selectedDate,
                  mode: DateTimeFieldPickerMode.date,
                  onChanged: (DateTime? value) {
                    setState(
                      () {
                        selectedDate = value;
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                labelTitle("Lieu de Naissance :"),
                const SizedBox(
                  height: 10,
                ),
                label("Veuillez entrer un lieu de naissance valide"),
                const SizedBox(
                  height: 10,
                ),
                labelTitle("Sexe :"),
                const SizedBox(
                  height: 10,
                ),
                RadioListTile(
                  activeColor: Colors.white,
                  hoverColor: Colors.white,
                  title: const Text(
                    "M",
                    style: TextStyle(color: Colors.white),
                  ),
                  value: "Male",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  activeColor: Colors.white,
                  title: const Text(
                    "F",
                    style: TextStyle(color: Colors.white),
                  ),
                  value: "Female",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                labelTitle("Salle de Classe :"),
                const SizedBox(
                  height: 10,
                ),
                dropdownButton(),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.indigo,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Enregistrer",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Elève enregistré avec succès !!!")));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dropdownButton() {
    return DropdownButtonFormField<String>(
        style: const TextStyle(color: Colors.white),
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

  Widget label(String msg) {
    return TextFormField(
      style: const TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return msg;
        }
        return null;
      },
    );
  }

  Widget labelTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.white54,
      ),
    );
  }
}


//  Row(
//                 children: [
//                   RadioListTile(
//                     title: Text("M"),
//                     value: "male",
//                     groupValue: gender,
//                     onChanged: (value) {
//                       setState(() {
//                         gender = value.toString();
//                       });
//                     },
//                   ),
//                   RadioListTile(
//                     title: Text("F"),
//                     value: "female",
//                     groupValue: gender,
//                     onChanged: (value) {
//                       setState(() {
//                         gender = value.toString();
//                       });
//                     },
//                   ),
//                 ],
//               ),