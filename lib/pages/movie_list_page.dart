import 'package:flutter/material.dart';

import 'detail_movie_page.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({super.key});

  static const List<Map<String, String>> _movies = [
    {
      'judul': 'Avatar 3',
      'genre': 'Sci-Fi, Adventure',
      'rating': '8.5',
      'poster': 'assets/posters/avatar3.jpeg',
      'sinopsis':
          'Jake Sully dan Neytiri kembali menjelajahi Pandora dan bertemu suku Na\'vi baru '
          'yang menguasai api, sambil melindungi keluarga mereka dari ancaman manusia.',
    },
    {
      'judul': 'Spider-Man',
      'genre': 'Action, Superhero',
      'rating': '8.2',
      'poster': 'assets/posters/spiderman.jpeg',
      'sinopsis':
          'Peter Parker berusaha menyeimbangkan kehidupan sekolah dan tugasnya sebagai '
          'Spider-Man saat penjahat baru mulai mengancam kota New York.',
    },
    {
      'judul': 'Inception',
      'genre': 'Sci-Fi, Thriller',
      'rating': '8.8',
      'poster': 'assets/posters/inception.jpeg',
      'sinopsis':
          'Dom Cobb, pencuri yang bisa masuk ke dalam mimpi orang lain, mendapat misi '
          'terakhir: menanamkan sebuah ide ke pikiran target lewat mimpi berlapis.',
    },
    {
      'judul': 'Resident Evil',
      'genre': 'Horror, Action',
      'rating': '7.4',
      'poster': 'assets/posters/resident_evil.jpg',
      'sinopsis':
          'Sekelompok orang terjebak di fasilitas rahasia Umbrella Corporation dan harus '
          'bertahan hidup dari serangan zombie hasil virus buatan.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: _movies.length,
      itemBuilder: (context, index) {
        final movie = _movies[index];

        return GestureDetector(
          onTap: () {
            // Kirim data film ke DetailMoviePage lewat constructor
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailMoviePage(
                  judul: movie['judul']!,
                  genre: movie['genre']!,
                  sinopsis: movie['sinopsis']!,
                  rating: movie['rating']!,
                  poster: movie['poster']!,
                ),
              ),
            );
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      movie['poster']!,
                      width: 70,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie['judul']!,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(movie['genre']!),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 18),
                            const SizedBox(width: 4),
                            Text(movie['rating']!),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
