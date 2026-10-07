import 'package:flutter/foundation.dart';

class FavoritModel extends ChangeNotifier {
  final List<String> _daftarFavorit = [];

  List<String> get daftarFavorit => _daftarFavorit;

  void tandai(String namaLayanan) {
    if (!_daftarFavorit.contains(namaLayanan)) {
      _daftarFavorit.add(namaLayanan);
      notifyListeners();
    }
  }

  void batalTandai(String namaLayanan) {
    if (_daftarFavorit.contains(namaLayanan)) {
      _daftarFavorit.remove(namaLayanan);
      notifyListeners();
    }
  }
}