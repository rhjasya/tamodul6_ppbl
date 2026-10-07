import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/pengajuan_model.dart';
import '../pages/beranda_page.dart';
import '../pages/layanan_page.dart';
import '../pages/warga_page.dart';
import 'app_routes.dart';

class KerangkaNavigasi extends StatefulWidget {
  const KerangkaNavigasi({super.key});

  @override
  State<KerangkaNavigasi> createState() =>
      _KerangkaNavigasiState();
}

class _KerangkaNavigasiState
    extends State<KerangkaNavigasi> {
  int indeksAktif = 0;

  final List<Widget> halaman = const [
    HalamanBeranda(),
    LayananPage(),
    WargaPage(),
  ];

  void ubahHalaman(int index) {
    setState(() {
      indeksAktif = index;
    });
  }

  Widget ikonWarga({
    bool terpilih = false,
  }) {
    return Builder(
      builder: (context) {
        final totalPengajuan =
            context.select<PengajuanModel, int>(
          (model) => model.totalPengajuan,
        );

        return Stack(
          clipBehavior: Clip.none,
          children: [
            Icon(
              terpilih
                  ? Icons.person
                  : Icons.person_outline,
            ),

            if (totalPengajuan > 0)
              Positioned(
                right: -8,
                top: -8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 18,
                    minHeight: 18,
                  ),
                  child: Text(
                    '$totalPengajuan',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final lebarLayar =
        MediaQuery.of(context).size.width;
    final layarLebar = lebarLayar >= 600;

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Nusantara Cerdas',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xff087cf0),
          foregroundColor: Colors.white,
        ),

        drawer: NavigationDrawer(
          onDestinationSelected: (index) {
            Navigator.pop(context);

            if (index == 0) {
              ubahHalaman(0);
            } else if (index == 1) {
              ubahHalaman(1);
            } else if (index == 2) {
              ubahHalaman(2);
            } else if (index == 3) {
              Navigator.pushNamed(
                context,
                AppRoutes.pengaturanKota,
              );
            } else if (index == 4) {
              Navigator.pushNamed(
                context,
                AppRoutes.tentang,
              );
            } else if (index == 5) {
              Navigator.pushNamed(
                context,
                AppRoutes.keluar,
              );
            }
          },
          children: const [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Nusantara Cerdas',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            NavigationDrawerDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: Text('Beranda'),
            ),

            NavigationDrawerDestination(
              icon: Icon(Icons.list_outlined),
              selectedIcon: Icon(Icons.list),
              label: Text('Layanan'),
            ),

            NavigationDrawerDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: Text('Warga'),
            ),

            NavigationDrawerDestination(
              icon: Icon(Icons.settings_outlined),
              selectedIcon: Icon(Icons.settings),
              label: Text('Pengaturan Kota'),
            ),

            NavigationDrawerDestination(
              icon: Icon(Icons.info_outline),
              selectedIcon: Icon(Icons.info),
              label: Text('Tentang Aplikasi'),
            ),

            NavigationDrawerDestination(
              icon: Icon(Icons.logout),
              selectedIcon: Icon(Icons.logout),
              label: Text('Keluar'),
            ),
          ],
        ),

        body: Row(
          children: [
            if (layarLebar)
              NavigationRail(
                selectedIndex: indeksAktif,
                onDestinationSelected: ubahHalaman,
                labelType: NavigationRailLabelType.all,
                destinations: [
                  const NavigationRailDestination(
                    icon: Icon(Icons.home_outlined),
                    selectedIcon: Icon(Icons.home),
                    label: Text('Beranda'),
                  ),

                  const NavigationRailDestination(
                    icon: Icon(Icons.list_outlined),
                    selectedIcon: Icon(Icons.list),
                    label: Text('Layanan'),
                  ),

                  NavigationRailDestination(
                    icon: ikonWarga(),
                    selectedIcon: ikonWarga(
                      terpilih: true,
                    ),
                    label: const Text('Warga'),
                  ),
                ],
              ),

            Expanded(
              child: halaman[indeksAktif],
            ),
          ],
        ),

        bottomNavigationBar: layarLebar
            ? null
            : NavigationBar(
                selectedIndex: indeksAktif,
                onDestinationSelected: ubahHalaman,
                destinations: [
                  const NavigationDestination(
                    icon: Icon(Icons.home_outlined),
                    selectedIcon: Icon(Icons.home),
                    label: 'Beranda',
                  ),

                  const NavigationDestination(
                    icon: Icon(Icons.list_outlined),
                    selectedIcon: Icon(Icons.list),
                    label: 'Layanan',
                  ),

                  NavigationDestination(
                    icon: ikonWarga(),
                    selectedIcon: ikonWarga(
                      terpilih: true,
                    ),
                    label: 'Warga',
                  ),
                ],
              ),
      ),
    );
  }
}