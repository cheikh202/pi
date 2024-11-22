import 'package:flutter/material.dart';

class AccueilPage extends StatefulWidget {
  @override
  _AccueilPageState createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  String searchQuery = ''; // État pour la barre de recherche

  final List<Map<String, dynamic>> services = [
    {'title': 'Plombier', 'icon': Icons.plumbing},
    {'title': 'Électricien', 'icon': Icons.electrical_services},
    {'title': 'Jardinier', 'icon': Icons.nature},
    {'title': 'Peintre', 'icon': Icons.format_paint},
    {'title': 'Mécanicien', 'icon': Icons.build},
    {'title': 'Technicien', 'icon': Icons.computer},
  ];

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
            // child: Container(
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     color: Colors.green.withOpacity(0.2), // Couleur de fond circulaire
            //     // boxShadow: [
            //     //   BoxShadow(
            //     //     color: Colors.grey.withOpacity(0.4),
            //     //     blurRadius: 6,
            //     //     offset: Offset(0, 3), // Ombre subtile
            //     //   ),
            //     // ],
            //   ),
            //   // child: Icon(
            //   //   // Icons.arrow_back, // Icône de retour
            //   //   // color: Colors.green, // Couleur de l'icône
            //   // ),
            // ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Accueil',
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            // Barre de recherche
            TextField(
              decoration: InputDecoration(
                hintText: 'Rechercher un service',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase(); // Mettre à jour la recherche
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              "Découvrez nos services",
              style: TextStyle(
                fontSize: 18,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // GridView pour afficher les services
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final service = services[index];
                  // Filtrer les services selon la recherche
                  if (searchQuery.isNotEmpty &&
                      !service['title'].toLowerCase().contains(searchQuery)) {
                    return SizedBox.shrink(); // Ne rien afficher si le service ne correspond pas
                  }
                  return GestureDetector(
                    onTap: () {
                      // Action lorsqu'on clique sur une carte
                      print("Vous avez cliqué sur ${service['title']}");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.green, width: 1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            service['icon'],
                            size: 50,
                            color: Colors.green,
                          ),
                          SizedBox(height: 8),
                          Text(
                            service['title'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Demandes'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
