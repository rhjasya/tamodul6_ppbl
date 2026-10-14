
import 'package:flutter/material.dart';
import '../pages/detail_layanan_page.dart';
import '../pages/formulir_pengajuan_page.dart';
import '../pages/chat_page.dart';
import '../pages/lokasi_kantor_page.dart';
import '../pages/statistik_layanan_page.dart';
import '../pages/keluar_page.dart';
import '../pages/pengaturan_kota_page.dart';
import '../pages/route_tidak_dikenal_page.dart';
import '../pages/riwayat_laporan_page.dart';
import '../pages/tentang_page.dart';
import 'kerangka_navigasi.dart';

class AppRoutes {
  static const String beranda = '/';
  static const String detailLayanan = '/detail-layanan';
  static const String detailPengajuan = '/detail-pengajuan';
  static const String formulirPengajuan = '/formulir-pengajuan';
  static const String chat = '/chat';
  static const String lokasiKantor = '/lokasi-kantor';
  static const String statistikLayanan = '/statistik-layanan';
  static const String riwayatLaporan = '/riwayat-laporan';
  static const String pengaturanKota = '/pengaturan-kota';
  static const String tentang = '/tentang';
  static const String keluar = '/keluar';

  static Map<String, WidgetBuilder> daftarRoute() {
    return {
      beranda: (context) => const KerangkaNavigasi(),
      formulirPengajuan: (context) =>
          const FormulirPengajuanPage(),
      chat: (context) => const ChatPage(),
      lokasiKantor: (context) => const LokasiKantorPage(),
      statistikLayanan: (context) =>
          const StatistikLayananPage(),
      riwayatLaporan: (context) => const RiwayatLaporanPage(),
      pengaturanKota: (context) => const PengaturanKotaPage(),
      tentang: (context) => const TentangPage(),
      keluar: (context) => const KeluarPage(),
    };
  }

  static Route<dynamic> bentukRoute(RouteSettings settings) {
    if (settings.name == detailLayanan) {
      final data = settings.arguments as Map<String, String>;

      return MaterialPageRoute(
        settings: settings,
        builder: (context) => DetailLayananPage(
          namaLayanan: data['namaLayanan']!,
          dinas: data['dinas']!,
          jam: data['jam']!,
          keterangan: data['keterangan']!,
        ),
      );
    }

    return MaterialPageRoute(
      settings: settings,
      builder: (context) => const RouteTidakDikenalPage(),
    );
  }

  static Route<dynamic> routeTidakDikenal(
    RouteSettings settings,
  ) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => const RouteTidakDikenalPage(),
    );
  }
}
