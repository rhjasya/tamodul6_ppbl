
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/theme_cubit.dart';
import '../cubit/favorit_cubit.dart';
import '../cubit/pengajuan_cubit.dart';
import '../navigation/app_routes.dart';

class WargaPage extends StatelessWidget {
  const WargaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(
            child: CircleAvatar(
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
          ),
          const SizedBox(height: 20),

          Text(
            'Warga Nusantara',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 25),

          // Pengaturan mode terang dan gelap
          Card(
            color: warna.surface,
            child: BlocBuilder<ThemeCubit, ThemeMode>(
              builder: (context, themeMode) {
                return SwitchListTile(
                  secondary: Icon(
                    themeMode == ThemeMode.dark
                        ? Icons.dark_mode
                        : Icons.light_mode,
                  ),
                  title: const Text('Mode gelap'),
                  subtitle: const Text(
                    'Sesuaikan tampilan aplikasi',
                  ),
                  value: themeMode == ThemeMode.dark,
                  onChanged: (_) {
                    context.read<ThemeCubit>().toggleTheme();
                  },
                );
              },
            ),
          ),

          const SizedBox(height: 16),

          // Identitas warga
          Card(
            color: warna.surface,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Identitas Warga',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 15),
                  const Text('Nama: Rhajasya Putra Ansar'),
                  const SizedBox(height: 10),
                  const Text('NIK: 707012400090'),
                  const SizedBox(height: 10),
                  const Text('Alamat: Kota Nusantara'),
                ],
              ),
            ),
          ),

          const SizedBox(height: 25),

          // Layanan favorit
          BlocBuilder<FavoritCubit, Set<String>>(
            builder: (context, daftarFavorit) {
              return Card(
                color: warna.surface,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Layanan Favorit',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 15),

                      if (daftarFavorit.isEmpty)
                        const Text('Belum ada layanan favorit.')
                      else
                        ...daftarFavorit.map(
                          (namaLayanan) => ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            title: Text(namaLayanan),
                            trailing: IconButton(
                              tooltip: 'Hapus favorit',
                              icon: const Icon(Icons.delete_outline),
                              onPressed: () {
                                context
                                    .read<FavoritCubit>()
                                    .batalTandai(namaLayanan);
                              },
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 25),

          // Daftar pengajuan
          BlocBuilder<PengajuanCubit, List<String>>(
            builder: (context, daftarPengajuan) {
              return Card(
                color: warna.surface,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Daftar Pengajuan',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Total pengajuan: ${daftarPengajuan.length}',
                      ),
                      const SizedBox(height: 12),

                      if (daftarPengajuan.isEmpty)
                        const Text('Belum ada pengajuan.')
                      else
                        ...daftarPengajuan.map(
                          (nama) => ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: const Icon(
                              Icons.assignment_outlined,
                            ),
                            title: Text(nama),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 25),

          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.riwayatLaporan,
                );
              },
              child: const Text('Lihat Riwayat Laporan'),
            ),
          ),
        ],
      ),
    );
  }
}
