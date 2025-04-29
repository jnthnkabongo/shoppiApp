import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _isDarkMode = false; // Pour gérer le thème sombre/clair
  bool _areNotificationsEnabled = true; // Pour gérer les notifications
  String profileImageUrl = 'https://www.w3schools.com/w3images/avatar2.png'; // URL avatar par défaut

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),

          // Avatar et informations utilisateur
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(profileImageUrl),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Jean Dupont',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'jean.dupont@example.com',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Notifications
          _buildSettingTile(
            icon: Icons.notifications,
            title: 'Notifications',
            subtitle: 'Recevez des notifications de l\'application.',
            trailing: Switch(
              value: _areNotificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _areNotificationsEnabled = value;
                });
              },
            ),
          ),
          
          // Langue
          _buildSettingTile(
            icon: Icons.language,
            title: 'Langue',
            subtitle: 'Choisissez votre langue préférée.',
            onTap: () {
              // Logique de sélection de langue
            },
          ),

          // Changer le mot de passe
          _buildSettingTile(
            icon: Icons.lock,
            title: 'Changer le mot de passe',
            subtitle: 'Modifiez votre mot de passe ici.',
            onTap: () {
              // Logique de changement de mot de passe
            },
          ),

          // Changer le thème
          _buildSettingTile(
            icon: Icons.brightness_6,
            title: 'Mode sombre',
            subtitle: 'Activez le mode sombre.',
            trailing: Switch(
              value: _isDarkMode,
              onChanged: (value) {
                setState(() {
                  _isDarkMode = value;
                });
                // Appliquer le thème sombre/clair ici
                if (_isDarkMode) {
                  // Appliquer le thème sombre
                  // Par exemple : ThemeData.dark()
                } else {
                  // Appliquer le thème clair
                  // Par exemple : ThemeData.light()
                }
              },
            ),
          ),
          
          // À propos
          _buildSettingTile(
            icon: Icons.info_outline,
            title: 'À propos',
            subtitle: 'En savoir plus sur l\'application.',
            onTap: () {
              // Logique de navigation vers l\'à propos
            },
          ),
          
          const SizedBox(height: 20),

          // Déconnexion
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton.icon(
              onPressed: () {
                // Logique de déconnexion
              },
              icon: const Icon(Icons.logout, color: Colors.white),
              label: const Text('Déconnexion', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    required String subtitle,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            leading: Icon(icon, color: Colors.black87),
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(subtitle),
            trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
          ),
        ),
      ),
    );
  }
}
