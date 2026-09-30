import 'package:flutter/material.dart';

class RiwayatLaporanPage extends StatelessWidget {
  const RiwayatLaporanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Laporan'),
        backgroundColor: const Color(0xff087cf0),
        foregroundColor: Colors.white,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Card(
            child: ListTile(
              leading: Icon(Icons.report),
              title: Text('Lampu Jalan Rusak'),
              subtitle: Text('Status: Diproses'),
            ),
          ),

          const Card(
            child: ListTile(
              leading: Icon(Icons.report),
              title: Text('Jalan Berlubang'),
              subtitle: Text('Status: Selesai'),
            ),
          ),

          const Card(
            child: ListTile(
              leading: Icon(Icons.report),
              title: Text('Sampah Menumpuk'),
              subtitle: Text('Status: Diproses'),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Tambah laporan ditekan'),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),

      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.home),
            ),

            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Pencarian laporan'),
                  ),
                );
              },
              icon: const Icon(Icons.search),
            ),

            const SizedBox(width: 40),

            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Tidak ada notifikasi baru'),
                  ),
                );
              },
              icon: const Icon(Icons.notifications),
            ),
          ],
        ),
      ),
    );
  }
}