# 🎬 CinePlay Mobile App

Tugas Praktikum Flutter — Konsentrasi Keahlian RPL (Mobile Programming)

| | |
|---|---|
| **Nama** | Apip |
| **Kelas** | XI RPL |
| **Tema** | Hiburan & Bioskop |

## 📱 Deskripsi

CinePlay adalah prototipe aplikasi informasi film dan pemesanan tiket bioskop. Aplikasi ini dibuat untuk mempraktikkan navigasi di Flutter: named routes, BottomNavigationBar, passing data, return value, dan reset stack.

## ✨ Fitur

1. **Login** — halaman awal dengan tombol *Masuk*.
2. **Halaman Utama** — 3 tab navigasi bawah: Film, Jadwal, dan Profile.
3. **Film Tayang** — daftar 4 film (Avatar 3, Spider-Man, Inception, Resident Evil). Kartu film bisa ditekan untuk melihat detail.
4. **Detail Film** — menampilkan judul, genre, rating, dan sinopsis film yang dipilih, dengan tombol *Kembali*.
5. **Jadwal Bioskop** — pilihan studio (Studio Regular, Studio IMAX 3D, Velvet VIP). Setiap studio menampilkan jadwal tayangnya, dan jadwal yang dipilih dikirim balik ke halaman sebelumnya.
6. **Profile** — foto, nama, riwayat pemesanan tiket, dan tombol *Logout*.

## 🧭 Konsep Navigasi yang Digunakan

| Konsep | Implementasi |
|---|---|
| Named Routes | `/login` (initialRoute) dan `/main` di `main.dart` |
| Replacement | `Navigator.pushReplacementNamed(context, '/main')` saat login |
| BottomNavigationBar State | `StatefulWidget` + `_selectedIndex` + `setState()` |
| Passing Data | `GestureDetector` → `Navigator.push` ke `DetailMoviePage` lewat constructor |
| Return Value | `await Navigator.push(...)` + `Navigator.pop(context, nilai)` di jadwal bioskop |
| Reset Stack | `Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false)` saat logout |

## 📂 Struktur Folder

```
lib/
├── main.dart
└── pages/
    ├── login_page.dart
    ├── main_navigation_page.dart
    ├── movie_list_page.dart
    ├── detail_movie_page.dart
    ├── jadwal_bioskop_page.dart
    ├── detail_jadwal_page.dart
    └── profile_page.dart
```

## ▶️ Cara Menjalankan

```bash
git clone https://github.com/ghaisanSnoze/CinePlay-MobileApp.git
cd CinePlay-MobileApp
flutter pub get
flutter run
```
