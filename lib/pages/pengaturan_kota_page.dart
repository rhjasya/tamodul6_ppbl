import 'package:flutter/material.dart';

class PengaturanKotaPage extends StatelessWidget {
  const PengaturanKotaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f7fb),

      appBar: AppBar(
        title: const Text('Pengaturan Kota'),
        backgroundColor: const Color(0xff087cf0),
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _menuPengaturan(
              context,
              Icons.notifications,
              'Notifikasi',
              'Atur pemberitahuan aplikasi',
            ),

            const SizedBox(height: 12),

            _menuPengaturan(
              context,
              Icons.warning_amber,
              'Informasi Darurat',
              'Informasi penting dari pemerintah kota',
            ),

            const SizedBox(height: 12),

            _menuPengaturan(
              context,
              Icons.location_city,
              'Informasi Kota',
              'Lihat informasi mengenai kota',
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuPengaturan(
    BuildContext context,
    IconData icon,
    String title,
    String description,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,

        leading: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: const Color(0xffe8f2ff),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: const Color(0xff087cf0),
          ),
        ),

        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),

        subtitle: Text(
          description,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.grey,
          ),
        ),

        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),

        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('$title dipilih'),
            ),
          );
        },
      ),
    );
  }
}