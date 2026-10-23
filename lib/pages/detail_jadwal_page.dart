import 'package:flutter/material.dart';

class DetailJadwalPage extends StatelessWidget {
  final String studio;

  const DetailJadwalPage({super.key, required this.studio});

  static const Map<String, List<Map<String, String>>> _jadwal = {
    'Studio Regular': [
      {'film': 'Avatar 3', 'jam': '12:00'},
      {'film': 'Spider-Man', 'jam': '14:30'},
      {'film': 'Inception', 'jam': '17:00'},
      {'film': 'Resident Evil', 'jam': '19:30'},
    ],
    'Studio IMAX 3D': [
      {'film': 'Avatar 3', 'jam': '13:00'},
      {'film': 'Spider-Man', 'jam': '16:00'},
      {'film': 'Avatar 3', 'jam': '19:00'},
    ],
    'Velvet VIP': [
      {'film': 'Inception', 'jam': '15:00'},
      {'film': 'Resident Evil', 'jam': '18:30'},
      {'film': 'Spider-Man', 'jam': '21:00'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    final jadwal = _jadwal[studio] ?? [];

    return Scaffold(
      appBar: AppBar(title: Text('Jadwal $studio')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: jadwal.length,
        itemBuilder: (context, index) {
          final item = jadwal[index];

          return Card(
            child: ListTile(
              leading: const Icon(Icons.access_time),
              title: Text(item['film']!),
              subtitle: Text('Jam ${item['jam']}'),
              trailing: const Text('Pilih'),
              // Kirim balik jadwal yang dipilih ke JadwalBioskopPage
              onTap: () => Navigator.pop(context, '${item['film']} (${item['jam']})'),
            ),
          );
        },
      ),
    );
  }
}
