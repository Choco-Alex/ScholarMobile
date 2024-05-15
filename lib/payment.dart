import 'package:flutter/material.dart';
import 'package:scholar/account.dart';
import 'package:scholar/drawer.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String? dropdownValue;

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
          child: Column(children: [
            const Text(
              "Effectuer un paiement.",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Entrer l'ID de l'élève :",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white54,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            labelForm("Veuillez entrer un Id !"),
            const SizedBox(
              height: 10,
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
                "Vérifier",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
              onPressed: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            Table(
              border: TableBorder.all(width: 0.5, color: Colors.white),
              children: const [
                TableRow(children: [
                  TableCell(
                    child: Row(
                      children: <Widget>[
                        Text(
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
                        Text(
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
                        Text(
                          '20',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          'KAM TAGNE FALLONE',
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
            ),
            const SizedBox(
              height: 40,
            ),
            dropdownButton(),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Selectionner moyen de paiement :",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset("assets/images/om.jfif"),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset("assets/images/momo.jfif"),
                  ),
                )
              ],
            )
          ]),
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
          "Selectionner la tranche",
          style: TextStyle(color: Colors.white),
        ),
        value: dropdownValue,
        items: <String>['Tranche 1', 'Tranche 2', 'Tranche 3']
            .map<DropdownMenuItem<String>>((String value) {
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

  Widget labelForm(String msg) {
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
