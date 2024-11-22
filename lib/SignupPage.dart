import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _isChecked = false; // État pour le CheckboxListTile
  bool _obscureText = true; // État pour la visibilité du mot de passe

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context); // Retour à la page précédente
              }
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green.withOpacity(0.2), // Couleur de fond circulaire
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    blurRadius: 6,
                    offset: Offset(0, 3), // Ombre subtile
                  ),
                ],
              ),
              child: Icon(
                Icons.arrow_back, // Icône de retour
                color: Colors.green, // Couleur de l'icône
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 50), // Espacement vers le bas
            // Section titre
            Text(
              "Nouvel utilisateur ?",
              style: TextStyle(
                fontSize: 18,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Créer votre compte",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 30), // Espacement après le titre
            // Formulaire
            TextField(
              decoration: InputDecoration(
                labelText: "Prénom",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                labelText: "Nom",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                labelText: "E-mail",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                labelText: "Mot de passe",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
              obscureText: _obscureText,
            ),
            SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                labelText: "Téléphone",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            SizedBox(height: 20),
            CheckboxListTile(
              value: _isChecked,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked = value ?? false;
                });
              },
              title: Text(
                "J'ai lu et accepté la politique de confidentialité",
                style: TextStyle(fontSize: 14),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
              dense: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isChecked
                  ? () {
                      // Action lorsque l'utilisateur clique sur "Commencer"
                      print("Inscription commencée !");
                    }
                  : null, // Désactivé si la case n'est pas cochée
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text(
                "COMMENCER",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 50), // Espacement inférieur
          ],
        ),
      ),
    );
  }
}




  // Widget helper pour créer les champs de texte avec une bordure arrondie
  Widget _buildTextField({
    required String label,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30), // Bordures arrondies
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 1.5),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 2),
          borderRadius: BorderRadius.circular(30),
        ),
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
    );
  }

