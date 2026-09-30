import 'package:flutter/material.dart';

import '../pages/beranda_page.dart';
import '../pages/layanan_page.dart';
import '../pages/warga_page.dart';
import 'app_routes.dart';

class KerangkaNavigasi extends StatefulWidget {
  const KerangkaNavigasi({super.key});

  @override
  State<KerangkaNavigasi> createState() => _KerangkaNavigasiState();
}

class _KerangkaNavigasiState extends State<KerangkaNavigasi> {
  int indeksAktif = 0;

  final List<Widget> halaman = const [
    BerandaPage(),
    LayananPage(),
    WargaPage(),
  ];

  void ubahHalaman(int index) {
    setState(() {
      indeksAktif = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final lebarLayar = MediaQuery.of(context).size.width;
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
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.home_outlined),
                    selectedIcon: Icon(Icons.home),
                    label: Text('Beranda'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.list_outlined),
                    selectedIcon: Icon(Icons.list),
                    label: Text('Layanan'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.person_outline),
                    selectedIcon: Icon(Icons.person),
                    label: Text('Warga'),
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
                destinations: const [
                  NavigationDestination(
                    icon: Icon(Icons.home_outlined),
                    selectedIcon: Icon(Icons.home),
                    label: 'Beranda',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.list_outlined),
                    selectedIcon: Icon(Icons.list),
                    label: 'Layanan',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.person_outline),
                    selectedIcon: Icon(Icons.person),
                    label: 'Warga',
                  ),
                ],
              ),
      ),
    );
  }
}