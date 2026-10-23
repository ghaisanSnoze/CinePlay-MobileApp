import 'package:flutter/material.dart';

import 'detail_jadwal_page.dart';

class JadwalBioskopPage extends StatelessWidget {
  const JadwalBioskopPage({super.key});

  static const List<Map<String, String>> _studios = [
    {'nama': 'Studio Regular', 'harga': 'Rp 40.000'},
    {'nama': 'Studio IMAX 3D', 'harga': 'Rp 75.000'},
    {'nama': 'Velvet VIP', 'harga': 'Rp 150.000'},
  ];

  Future<void> _bukaJadwal(BuildContext context, String studio) async {
    // await: tunggu DetailJadwalPage ditutup, lalu ambil jadwal yang dipilih
    final String? jadwalDipilih = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailJadwalPage(studio: studio)),
    );

    if (jadwalDipilih != null && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Tiket dipesan: $jadwalDipilih di $studio')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: _studios.length,
      itemBuilder: (context, index) {
        final studio = _studios[index];

        return Card(
          child: ListTile(
            leading: const Icon(Icons.theaters, size: 36),
            title: Text(studio['nama']!),
            subtitle: Text(studio['harga']!),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _bukaJadwal(context, studio['nama']!),
          ),
        );
      },
    );
  }
}
