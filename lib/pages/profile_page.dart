import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const List<Map<String, String>> _riwayat = [
    {'film': 'Avatar 3', 'studio': 'Studio IMAX 3D', 'waktu': '20 Okt 2026, 19:00'},
    {'film': 'Inception', 'studio': 'Velvet VIP', 'waktu': '12 Okt 2026, 15:00'},
    {'film': 'Spider-Man', 'studio': 'Studio Regular', 'waktu': '5 Okt 2026, 14:30'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Center(
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/foto.jpg'),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Apip',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const Text('XI RPL', textAlign: TextAlign.center),
        const SizedBox(height: 24),
        const Text(
          'Riwayat Pemesanan',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        for (final item in _riwayat)
          Card(
            child: ListTile(
              leading: const Icon(Icons.confirmation_number),
              title: Text(item['film']!),
              subtitle: Text('${item['studio']} • ${item['waktu']}'),
            ),
          ),
        const SizedBox(height: 24),
        ElevatedButton.icon(
          onPressed: () {
            // Hapus semua halaman di stack, lalu kembali ke Login
            Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
          },
          icon: const Icon(Icons.logout),
          label: const Text('Logout'),
        ),
      ],
    );
  }
}
