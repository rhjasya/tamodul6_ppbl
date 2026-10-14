
import 'package:flutter/material.dart';

class DetailPengajuanPage extends StatelessWidget {
  final String namaLayanan;

  const DetailPengajuanPage({
    super.key,
    required this.namaLayanan,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pengajuan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: ListTile(
            leading: const Icon(Icons.description),
            title: const Text('Nama Layanan'),
            subtitle: Text(namaLayanan),
          ),
        ),
      ),
    );
  }
}
