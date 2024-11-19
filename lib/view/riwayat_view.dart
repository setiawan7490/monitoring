import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../provider/kehadiran_provider.dart';

class RiwayatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<KehadiranProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Riwayat Kehadiran')),
      body: ListView.builder(
        itemCount: provider.riwayat.length,
        itemBuilder: (context, index) {
          final riwayat = provider.riwayat[index];
          final tanggalFormat = DateFormat('dd-MM-yyyy HH:mm').format(riwayat.tanggal);

          return ListTile(
            title: Text(riwayat.toString()), // Menampilkan nama dan status kehadiran
            subtitle: Text('Tanggal: $tanggalFormat'), // Menampilkan tanggal dan waktu
          );
        },
      ),
    );
  }
}
