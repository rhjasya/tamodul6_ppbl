
import 'package:flutter_bloc/flutter_bloc.dart';

class PengajuanCubit extends Cubit<List<String>> {
  PengajuanCubit() : super(<String>[]);

  List<String> get daftarPengajuan => state;

  int get totalPengajuan => state.length;

  Map<String, int> get statistikBidang {
    final hasil = <String, int>{
      'Administrasi': 0,
      'Kependudukan': 0,
      'Kesehatan': 0,
      'Infrastruktur': 0,
    };

    for (final namaLayanan in state) {
      final nama = namaLayanan.toLowerCase();

      if (nama.contains('ktp') ||
          nama.contains('kependudukan') ||
          nama.contains('kartu keluarga') ||
          nama.contains('akta')) {
        hasil['Kependudukan'] = hasil['Kependudukan']! + 1;
      } else if (nama.contains('kesehatan') ||
          nama.contains('puskesmas') ||
          nama.contains('posyandu') ||
          nama.contains('imunisasi') ||
          nama.contains('ambulans')) {
        hasil['Kesehatan'] = hasil['Kesehatan']! + 1;
      } else if (nama.contains('jalan') ||
          nama.contains('infrastruktur') ||
          nama.contains('drainase') ||
          nama.contains('lampu jalan')) {
        hasil['Infrastruktur'] = hasil['Infrastruktur']! + 1;
      } else {
        hasil['Administrasi'] = hasil['Administrasi']! + 1;
      }
    }

    return hasil;
  }

  void tambahPengajuan(String namaLayanan) {
    emit([...state, namaLayanan]);
  }

  void hapusPengajuan(String namaLayanan) {
    final daftarBaru = List<String>.from(state);
    daftarBaru.remove(namaLayanan);
    emit(daftarBaru);
  }

  void kosongkan() {
    emit(<String>[]);
  }
}
