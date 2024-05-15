import 'package:flutter/material.dart';
import 'package:scholar/sign_up.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  bool souvenir = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
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
                height: 150,
                width: 150,
                decoration: const BoxDecoration(),
                child: Image.asset("assets/images/logo.png"),
              ),
              const Text(
                "Welcome Back",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  wordSpacing: 5,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                key: _formkey,
                child: Container(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  width: double.maxFinite,
                  height: 500,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "CONNEXION A VOTRE COMPTE",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Entrer votre login et mot de passe",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "E-mail",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.mail,
                            color: Colors.indigo,
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 12.0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your Login";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Mot de Passe",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.indigo,
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 12.0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your password";
                          }
                          if (!value.contains(RegExp(r'[a-z]'))) {
                            return 'Le mot de passe doit contenir au moins une lettre minuscule.';
                          }
                          if (!value.contains(RegExp(r'[A-Z]'))) {
                            return 'Le mot de passe doit contenir au moins une lettre majuscule.';
                          }
                          if (!value.contains(RegExp(r'[0-9]'))) {
                            return 'Le mot de passe doit contenir au moins un chiffre.';
                          }
                          if (!value.contains(RegExp(r'[!@#$%^&*()]'))) {
                            return 'Le mot de passe doit contenir au moins un caractère spécial.';
                          }
                          if (value.length < 8 || value.length > 12) {
                            return 'Le mot de passe doit contenir entre 8 et 12 caractères.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            activeColor: Colors.indigo,
                            value: souvenir,
                            onChanged: (value) {
                              setState(() {
                                souvenir = value!;
                              });
                            },
                          ),
                          Text(
                            "Se souvenir de moi",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.indigo,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          "Se Connecter",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: 
                                        Text("Connexion avec succès !!!")));
                          }
                        },
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account ?",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignIn()),
                              );
                            },
                            child: const Text(
                              "Sign up",
                              style: TextStyle(
                                color: Colors.indigo,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
