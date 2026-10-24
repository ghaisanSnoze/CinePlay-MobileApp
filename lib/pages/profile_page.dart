import 'package:flutter/material.dart';

import '../data/riwayat_pemesanan.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
        if (riwayatPemesanan.isEmpty) const Text('Belum ada riwayat pemesanan.'),
        for (final item in riwayatPemesanan)
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
            riwayatPemesanan.clear();

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
