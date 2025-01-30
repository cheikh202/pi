import 'package:flutter/material.dart';

class ArtisanPage extends StatefulWidget {
  @override
  _ArtisanDashboardPageState createState() => _ArtisanDashboardPageState();
}

class _ArtisanDashboardPageState extends State<ArtisanPage> {
  bool _isBalanceVisible = false; // État pour afficher ou masquer le solde

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.notifications, color: Colors.grey),
          onPressed: () {
            // Notification logic here
          },
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu, color: Colors.grey),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(color: Colors.white),
              accountName: Text(
                "Mohamed Mahmoud Sidi",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "42803187",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.teal,
                child: Text(
                  "MS",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.notifications, color: Colors.black),
                    title: Text("الإشعارات"),
                    onTap: () {
                      // Gérer les notifications ici
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.history, color: Colors.black),
                    title: Text("المعاملات"),
                    onTap: () {
                      // Gérer les transactions ici
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.people, color: Colors.black),
                    title: Text("الوكلاء"),
                    onTap: () {
                      // Gérer les agents ici
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      // Logique pour Arabe
                    },
                    child: Text(
                      "العربية",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Logique pour Français
                    },
                    child: Text(
                      "Français",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Carte du compte artisan
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'BingBong',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '42803187',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Solde : ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                _isBalanceVisible ? '2000' : '*****',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 8),
                              Switch(
                                value: _isBalanceVisible,
                                onChanged: (value) {
                                  setState(() {
                                    _isBalanceVisible = value;
                                  });
                                },
                                activeColor: Colors.white,
                                activeTrackColor: Colors.teal.shade300,
                                inactiveThumbColor: Colors.white,
                                inactiveTrackColor: Colors.teal.shade200,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Mohamed Mahmoud Sidi',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildOption(Icons.shopping_bag, 'Gérer les commandes'),
                  _buildOption(Icons.attach_money, 'Suivi des paiements'),
                  _buildOption(Icons.add_business, 'Ajouter des produits'),
                  _buildOption(Icons.bar_chart, 'Statistiques'),
                  _buildOption(Icons.chat, 'Messages clients'),
                  _buildOption(Icons.settings, 'Paramètres'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(IconData icon, String label) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.teal),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
