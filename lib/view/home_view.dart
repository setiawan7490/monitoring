import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/kehadiran_provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<KehadiranProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Presensi Siswa')),
      body: Column(
        children: [
          // Daftar siswa dengan checkbox
          Expanded(
            child: ListView.builder(
              itemCount: provider.daftarSiswa.length,
              itemBuilder: (context, index) {
                final siswa = provider.daftarSiswa[index];
                return CheckboxListTile(
                  title: Text(siswa.name),
                  value: siswa.isPresent,
                  onChanged: (value) {
                    siswa.isPresent = value ?? false;
                    provider.notifyListeners(); // Perbarui tampilan
                  },
                );
              },
            ),
          ),

          // Tombol Simpan Kehadiran
          ElevatedButton(
            onPressed: provider.daftarSiswa.any((s) => s.isPresent)
                ? () {
                    provider.simpanKehadiran();

                    // Tampilkan pop-up dialog
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Berhasil'),
                          content: Text('Kehadiran telah disimpan!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Tutup dialog
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                : null, // Tombol dinonaktifkan jika semua siswa belum hadir
            child: Text('Simpan Kehadiran'),
          ),
        ],
      ),
    );
  }
}
