import 'package:flutter_test/flutter_test.dart';

import 'package:cineplay_app_apip/main.dart';

void main() {
  testWidgets('Alur lengkap CinePlay', (tester) async {
    await tester.pumpWidget(const CinePlayApp());

    // Login -> Main
    await tester.tap(find.text('Masuk'));
    await tester.pumpAndSettle();
    expect(find.text('Film Tayang'), findsOneWidget);

    // Klik kartu film -> Detail -> Kembali
    await tester.tap(find.text('Inception'));
    await tester.pumpAndSettle();
    expect(find.text('Sinopsis'), findsOneWidget);
    expect(find.text('Genre: Sci-Fi, Thriller'), findsOneWidget);
    await tester.ensureVisible(find.text('Kembali'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Kembali'));
    await tester.pumpAndSettle();

    // Tab Jadwal -> pilih studio -> pilih jam -> data dikirim balik
    await tester.tap(find.text('Jadwal'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Studio IMAX 3D'));
    await tester.pumpAndSettle();
    expect(find.text('Jadwal Studio IMAX 3D'), findsOneWidget);
    await tester.tap(find.text('Jam 16:00'));
    await tester.pumpAndSettle();
    expect(find.text('Tiket dipesan: Spider-Man (16:00) di Studio IMAX 3D'), findsOneWidget);
    await tester.pump(const Duration(seconds: 5)); // tunggu SnackBar hilang
    await tester.pumpAndSettle();

    // Tab Profile -> Logout -> balik ke Login, stack kosong
    await tester.tap(find.text('Profile').last);
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(find.text('Logout'), 200);
    await tester.tap(find.text('Logout'));
    await tester.pumpAndSettle();
    expect(find.text('Masuk'), findsOneWidget);
    expect(find.text('Film Tayang'), findsNothing);
  });
}
