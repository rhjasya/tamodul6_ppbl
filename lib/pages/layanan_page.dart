import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/favorit_model.dart';
import '../navigation/app_routes.dart';

class LayananPage extends StatelessWidget {
  const LayananPage({super.key});

  void bukaDetail(
    BuildContext context,
    Map<String, String> layanan,
  ) async {
    final hasil = await Navigator.pushNamed(
      context,
      AppRoutes.detailLayanan,
      arguments: layanan,
    );

    if (!context.mounted) return;

    if (hasil != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(hasil.toString()),
        ),
      );
    }
  }

  Widget buatLayanan(
    BuildContext context,
    String nama,
    String dinas,
    String jam,
    String keterangan,
  ) {
    final favorit = context.watch<FavoritModel>();
    final sudahFavorit = favorit.daftarFavorit.contains(nama);

    return Card(
      child: ListTile(
        leading: const Icon(
          Icons.description,
          color: Color(0xff087cf0),
        ),
        title: Text(
          nama,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(dinas),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                if (sudahFavorit) {
                  context.read<FavoritModel>().batalTandai(nama);
                } else {
                  context.read<FavoritModel>().tandai(nama);
                }
              },
              icon: Icon(
                sudahFavorit
                    ? Icons.star
                    : Icons.star_border,
                color: sudahFavorit
                    ? Colors.amber
                    : Colors.grey,
              ),
            ),
            const Icon(Icons.arrow_forward),
          ],
        ),
        onTap: () {
          bukaDetail(
            context,
            {
              'namaLayanan': nama,
              'dinas': dinas,
              'jam': jam,
              'keterangan': keterangan,
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(text: 'Perizinan'),
              Tab(text: 'Kesehatan'),
              Tab(text: 'Transportasi'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    buatLayanan(
                      context,
                      'Izin Usaha',
                      'Dinas Penanaman Modal',
                      '08.00 - 15.00',
                      'Layanan pengurusan izin usaha warga.',
                    ),
                    buatLayanan(
                      context,
                      'Izin Bangunan',
                      'Dinas Tata Ruang',
                      '08.00 - 15.00',
                      'Layanan pengurusan izin bangunan.',
                    ),
                    buatLayanan(
                      context,
                      'Izin Keramaian',
                      'Dinas Pelayanan Publik',
                      '08.00 - 14.00',
                      'Layanan pengurusan izin kegiatan warga.',
                    ),
                  ],
                ),
                ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    buatLayanan(
                      context,
                      'Pendaftaran Puskesmas',
                      'Dinas Kesehatan',
                      '07.30 - 14.00',
                      'Layanan pendaftaran puskesmas.',
                    ),
                    buatLayanan(
                      context,
                      'Jadwal Imunisasi',
                      'Dinas Kesehatan',
                      '08.00 - 13.00',
                      'Informasi jadwal imunisasi warga.',
                    ),
                    buatLayanan(
                      context,
                      'Ambulans Kota',
                      'Dinas Kesehatan',
                      '24 Jam',
                      'Layanan ambulans kota.',
                    ),
                  ],
                ),
                ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    buatLayanan(
                      context,
                      'Kartu Transportasi',
                      'Dinas Perhubungan',
                      '08.00 - 15.00',
                      'Pengajuan kartu transportasi warga.',
                    ),
                    buatLayanan(
                      context,
                      'Informasi Rute Bus',
                      'Dinas Perhubungan',
                      '24 Jam',
                      'Informasi rute bus kota.',
                    ),
                    buatLayanan(
                      context,
                      'Pengaduan Transportasi',
                      'Dinas Perhubungan',
                      '08.00 - 16.00',
                      'Pengaduan masalah transportasi.',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}