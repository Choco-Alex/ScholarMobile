import 'package:flutter/material.dart';

class Error_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
// On utilise le widget MyScaffold au lieu du Scaffold classique
    return Scaffold(
// On passe les widgets correspondant à la page

      body: Center(
        child: Text(
          'Erreur lors de l\'ouverture de la page',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
