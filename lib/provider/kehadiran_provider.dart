import 'package:flutter/material.dart';
import '../model/siswa.dart';

// Model untuk menyimpan riwayat kehadiran
class RiwayatKehadiran {
  final String namaSiswa;
  final bool isPresent;
  final DateTime tanggal;

  RiwayatKehadiran({
    required this.namaSiswa,
    required this.isPresent,
    required this.tanggal,
  });

  @override
  String toString() {
    return '$namaSiswa: ${isPresent ? 'Hadir' : 'Tidak Hadir'}';
  }
}

class KehadiranProvider with ChangeNotifier {

  // Daftar Siswa
  List<Siswa> daftarSiswa = [
    Siswa('Ali', false),
    Siswa('Budi', false),
    Siswa('Citra', false),
  ];

  // Daftar Riwayat Kehadiran
  List<RiwayatKehadiran> riwayat = [];

  // Simpan Kehadiran
  void simpanKehadiran() {
    DateTime now = DateTime.now();
    for (var siswa in daftarSiswa) {
      riwayat.add(RiwayatKehadiran(
        namaSiswa: siswa.name,
        isPresent: siswa.isPresent,
        tanggal: now,
      ));
    }

    // Reset Kehadiran
    for (var siswa in daftarSiswa) {
      siswa.isPresent = false;
    }

    // Perbarui tampilan
    notifyListeners();
  }
}