
import 'package:flutter/foundation.dart';

class PengajuanModel extends ChangeNotifier {
  final List<String> _daftarPengajuan = [];

  List<String> get daftarPengajuan => _daftarPengajuan;

  int get totalPengajuan => _daftarPengajuan.length;

  Map<String, int> get statistikBidang {
    final Map<String, int> hasil = {
      'Administrasi': 0,
      'Kependudukan': 0,
      'Kesehatan': 0,
      'Infrastruktur': 0,
    };

    for (final namaLayanan in _daftarPengajuan) {
      final nama = namaLayanan.toLowerCase();

      if (nama.contains('ktp') ||
          nama.contains('kependudukan') ||
          nama.contains('kartu keluarga') ||
          nama.contains('akta')) {
        hasil['Kependudukan'] =
            hasil['Kependudukan']! + 1;
      } else if (nama.contains('kesehatan') ||
          nama.contains('puskesmas') ||
          nama.contains('posyandu')) {
        hasil['Kesehatan'] =
            hasil['Kesehatan']! + 1;
      } else if (nama.contains('jalan') ||
          nama.contains('infrastruktur') ||
          nama.contains('drainase') ||
          nama.contains('lampu jalan')) {
        hasil['Infrastruktur'] =
            hasil['Infrastruktur']! + 1;
      } else {
        hasil['Administrasi'] =
            hasil['Administrasi']! + 1;
      }
    }

    return hasil;
  }

  void tambahPengajuan(String namaLayanan) {
    _daftarPengajuan.add(namaLayanan);
    notifyListeners();
  }
}
