
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/pengajuan_cubit.dart';
import '../pages/beranda_page.dart';
import '../pages/layanan_page.dart';
import '../pages/warga_page.dart';
import '../pages/formulir_pengajuan_page.dart';
import '../pages/chat_page.dart';
import '../pages/lokasi_kantor_page.dart';
import '../pages/statistik_layanan_page.dart';
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

  void bukaHalaman(Widget halamanBaru) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => halamanBaru,
      ),
    );
  }

  void bukaRoute(String route) {
    Navigator.pop(context);
    Navigator.pushNamed(context, route);
  }

  // Ikon Warga dengan badge jumlah pengajuan.
  Widget ikonWarga({bool terpilih = false}) {
    return BlocSelector<PengajuanCubit, List<String>, int>(
      selector: (daftarPengajuan) =>
          daftarPengajuan.length,
      builder: (context, totalPengajuan) {
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

  // Menu samping tetap menggunakan tampilan asli.
  Widget menuSamping(
    IconData ikon,
    IconData ikonTerpilih,
    String judul,
    VoidCallback aksi,
  ) {
    return ListTile(
      leading: Icon(ikon),
      title: Text(judul),
      onTap: aksi,
    );
  }

  void pilihHalaman(int index) {
    Navigator.pop(context);
    ubahHalaman(index);
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

            switch (index) {
              case 0:
                ubahHalaman(0);
                break;
              case 1:
                ubahHalaman(1);
                break;
              case 2:
                ubahHalaman(2);
                break;
              case 3:
                bukaHalaman(
                  const FormulirPengajuanPage(),
                );
                break;
              case 4:
                bukaHalaman(const ChatPage());
                break;
              case 5:
                bukaHalaman(
                  const LokasiKantorPage(),
                );
                break;
              case 6:
                bukaHalaman(
                  const StatistikLayananPage(),
                );
                break;
              case 7:
                Navigator.pushNamed(
                  context,
                  AppRoutes.pengaturanKota,
                );
                break;
              case 8:
                Navigator.pushNamed(
                  context,
                  AppRoutes.tentang,
                );
                break;
              case 9:
                Navigator.pushNamed(
                  context,
                  AppRoutes.keluar,
                );
                break;
            }
          },
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Nusantara Cerdas',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const NavigationDrawerDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: Text('Beranda'),
            ),

            const NavigationDrawerDestination(
              icon: Icon(Icons.list_outlined),
              selectedIcon: Icon(Icons.list),
              label: Text('Layanan'),
            ),

            NavigationDrawerDestination(
              icon: ikonWarga(),
              selectedIcon: ikonWarga(
                terpilih: true,
              ),
              label: const Text('Warga'),
            ),

            const NavigationDrawerDestination(
              icon: Icon(Icons.assignment_outlined),
              selectedIcon: Icon(Icons.assignment),
              label: Text('Formulir Pengajuan'),
            ),

            const NavigationDrawerDestination(
              icon: Icon(Icons.chat_outlined),
              selectedIcon: Icon(Icons.chat),
              label: Text('Chat Bantuan'),
            ),

            const NavigationDrawerDestination(
              icon: Icon(Icons.location_on_outlined),
              selectedIcon: Icon(Icons.location_on),
              label: Text('Lokasi Kantor'),
            ),

            const NavigationDrawerDestination(
              icon: Icon(Icons.bar_chart_outlined),
              selectedIcon: Icon(Icons.bar_chart),
              label: Text('Statistik Layanan'),
            ),

            const NavigationDrawerDestination(
              icon: Icon(Icons.settings_outlined),
              selectedIcon: Icon(Icons.settings),
              label: Text('Pengaturan Kota'),
            ),

            const NavigationDrawerDestination(
              icon: Icon(Icons.info_outline),
              selectedIcon: Icon(Icons.info),
              label: Text('Tentang Aplikasi'),
            ),

            const NavigationDrawerDestination(
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
                labelType:
                    NavigationRailLabelType.all,
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
              child: IndexedStack(
                index: indeksAktif,
                children: halaman,
              ),
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
