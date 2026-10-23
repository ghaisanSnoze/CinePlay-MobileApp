import 'package:flutter/material.dart';

class DetailMoviePage extends StatelessWidget {
  final String judul;
  final String genre;
  final String sinopsis;
  final String rating;
  final String poster;

  const DetailMoviePage({
    super.key,
    required this.judul,
    required this.genre,
    required this.sinopsis,
    required this.rating,
    required this.poster,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(judul)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(poster, height: 300),
              ),
            ),
            const SizedBox(height: 16),
            Text(judul, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Genre: $genre'),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 20),
                const SizedBox(width: 4),
                Text('$rating / 10'),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Sinopsis', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(sinopsis),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Kembali'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
