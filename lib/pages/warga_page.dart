import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/favorit_model.dart';
import '../navigation/app_routes.dart';

class WargaPage extends StatelessWidget {
  const WargaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundColor: Color(0xffc9f4e8),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xff173b59),
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Warga Nusantara',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 25),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Identitas Warga',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 15),

                Text('Nama: Rhajasya Putra Ansar'),

                SizedBox(height: 10),

                Text('NIK: 707012400090'),

                SizedBox(height: 10),

                Text('Alamat: Kota Nusantara'),
              ],
            ),
          ),

          const SizedBox(height: 25),

          Consumer<FavoritModel>(
            builder: (context, favorit, child) {
              return Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Layanan Favorit',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    if (favorit.daftarFavorit.isEmpty)
                      const Text(
                        'Belum ada layanan favorit.',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )
                    else
                      ...favorit.daftarFavorit.map(
                        (namaLayanan) {
                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            title: Text(namaLayanan),
                          );
                        },
                      ),
                  ],
                ),
              );
            },
          ),

          const SizedBox(height: 25),

          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.riwayatLaporan,
                );
              },
              child: const Text(
                'Lihat Riwayat Laporan',
              ),
            ),
          ),
        ],
      ),
    );
  }
}