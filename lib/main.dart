// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             // Section supérieure avec le logo et les textes
//             Expanded(
//               flex: 3,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Logo agrandi pour occuper la moitié de l'écran
//                   Image.asset(
//                     'assets/images/logo.png', // Remplacez par votre chemin d'image
//                     height: MediaQuery.of(context).size.height * 0.4, // 50% de la hauteur de l'écran
//                     fit: BoxFit.contain, // Conserver les proportions de l'image
//                   ),
//                   SizedBox(height: 30), // Espacement entre le logo et le texte suivant
//                   // Titre principal, texte réduit
//                   Text(
//                     "Des bricoleurs professionnels\net compétents",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 18, // Taille du texte réduite
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   SizedBox(height: 15),
//                   // Sous-titre avec style modernisé
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 30),
//                     child: Text(
//                       "Des milliers de personnes utilisent 9adlia pour leurs travaux de dépannage.",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 14, // Taille plus petite
//                         color: Colors.grey[600],
//                         height: 1.5, // Espacement entre les lignes
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // Section inférieure avec les boutons
//             Expanded(
//               flex: 2,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Bouton "S'INSCRIRE" avec style normal
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // Action pour le bouton
//                       },
//                       style: ElevatedButton.styleFrom(
//                         shadowColor: Colors.green.withOpacity(0.5),
//                         elevation: 8,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         minimumSize: Size(double.infinity, 55),
//                         backgroundColor: Colors.green, // Couleur du bouton
//                       ),
//                       child: Text(
//                         "S'INSCRIRE",
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 15),
//                   // Bouton "S'INSCRIRE EN TANT QUE BRICOLEUR" sans changement
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: OutlinedButton(
//                       onPressed: () {
//                         // Action pour le bouton
//                       },
//                       style: OutlinedButton.styleFrom(
//                         side: BorderSide(color: Colors.green, width: 2),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         minimumSize: Size(double.infinity, 55), // Taille du bouton
//                       ),
//                       child: Text(
//                         "S'INSCRIRE EN TANT QUE BRICOLEUR ?",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.green,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 15),
//                   // Lien "VOUS AVEZ DÉJÀ UN COMPTE ?" en couleur normale
//                   TextButton(
//                     onPressed: () {
//                       // Action pour le bouton
//                     },
//                     child: Text(
//                       "VOUS AVEZ DÉJÀ UN COMPTE ?",
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.black87,
//                         decoration: TextDecoration.underline,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   // Texte "CONNECTEZ-VOUS" avec la même couleur que le bouton "S'INSCRIRE"
//                   Text(
//                     "CONNECTEZ-VOUS",
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.green, // Couleur du bouton
//                       decoration: TextDecoration.underline,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'SignupPage.dart';
import 'AcceuilPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/signup': (context) => SignupPage(),
        '/Acceuil': (context) => AccueilPage()// Route vers la page d'inscription
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Section supérieure avec le logo et les textes
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo agrandi pour occuper la moitié de l'écran
                  Image.asset(
                    'assets/images/logo.png', // Remplacez par votre chemin d'image
                    height: MediaQuery.of(context).size.height * 0.4, // 50% de la hauteur de l'écran
                    fit: BoxFit.contain, // Conserver les proportions de l'image
                  ),
                  SizedBox(height: 30), // Espacement entre le logo et le texte suivant
                  // Titre principal, texte réduit
                  Text(
                    "Des bricoleurs professionnels\net compétents",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18, // Taille du texte réduite
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 15),
                  // Sous-titre avec style modernisé
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Des milliers de personnes utilisent 9adlia pour leurs travaux de dépannage.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14, // Taille plus petite
                        color: Colors.grey[600],
                        height: 1.5, // Espacement entre les lignes
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Section inférieure avec les boutons
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Bouton "S'INSCRIRE" avec navigation
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                         // Navigation vers la page de création de compte
                      },
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.green.withOpacity(0.5),
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        minimumSize: Size(double.infinity, 55),
                        backgroundColor: Colors.green, // Couleur du bouton
                      ),
                      child: Text(
                        "S'INSCRIRE",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  // Bouton "S'INSCRIRE EN TANT QUE BRICOLEUR" sans changement
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/Acceuil');// Action pour le bouton
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.green, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        minimumSize: Size(double.infinity, 55), // Taille du bouton
                      ),
                      child: Text(
                        "S'INSCRIRE EN TANT QUE BRICOLEUR ?",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  // Lien "VOUS AVEZ DÉJÀ UN COMPTE ?" en couleur normale
                  TextButton(
                    onPressed: () {
                      // Action pour le bouton
                    },
                    child: Text(
                      "VOUS AVEZ DÉJÀ UN COMPTE ?",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // Texte "CONNECTEZ-VOUS" avec la même couleur que le bouton "S'INSCRIRE"
                  Text(
                    "CONNECTEZ-VOUS",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.green, // Couleur du bouton
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
