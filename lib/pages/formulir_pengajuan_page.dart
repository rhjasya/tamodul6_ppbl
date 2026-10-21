
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/pengajuan_cubit.dart';

class FormulirPengajuanPage extends StatefulWidget {
  const FormulirPengajuanPage({super.key});

  @override
  State<FormulirPengajuanPage> createState() =>
      _FormulirPengajuanPageState();
}

class _FormulirPengajuanPageState
    extends State<FormulirPengajuanPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _namaController =
      TextEditingController();

  final TextEditingController _emailController =
      TextEditingController();

  String? _layanan;
  String _sesi = 'Pagi';
  bool _setuju = false;
  bool _loading = false;

  final List<String> _daftarLayanan = [
    'Administrasi',
    'Kependudukan',
    'Kesehatan',
    'Infrastruktur',
  ];

  @override
  void dispose() {
    _namaController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _kirimPengajuan() async {
    if (!_formKey.currentState!.validate()) return;

    if (_layanan == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Silakan pilih layanan terlebih dahulu.',
          ),
        ),
      );
      return;
    }

    if (!_setuju) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Silakan setujui penggunaan data pribadi.',
          ),
        ),
      );
      return;
    }

    setState(() {
      _loading = true;
    });

    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;

    context.read<PengajuanCubit>().tambahPengajuan(_layanan!);

    setState(() {
      _loading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Pengajuan berhasil dikirim!'),
        backgroundColor: Colors.green,
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulir Pengajuan'),
        backgroundColor: const Color(0xff087cf0),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ajukan Layanan Warga',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Lengkapi data berikut untuk mengajukan layanan.',
              ),
              const SizedBox(height: 24),

              // Nama lengkap
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Lengkap',
                  hintText: 'Masukkan nama lengkap',
                  prefixIcon: Icon(Icons.person_outline),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama lengkap wajib diisi.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Email
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'contoh@email.com',
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Email wajib diisi.';
                  }

                  final polaEmail = RegExp(
                    r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                  );

                  if (!polaEmail.hasMatch(value.trim())) {
                    return 'Masukkan alamat email yang valid.';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Pilihan layanan
              DropdownButtonFormField<String>(
                value: _layanan,
                decoration: const InputDecoration(
                  labelText: 'Bidang Layanan',
                  prefixIcon: Icon(
                    Icons.miscellaneous_services,
                  ),
                  border: OutlineInputBorder(),
                ),
                items: _daftarLayanan.map((layanan) {
                  return DropdownMenuItem<String>(
                    value: layanan,
                    child: Text(layanan),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _layanan = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Pilih bidang layanan.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              const Text(
                'Sesi Kunjungan',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              RadioListTile<String>(
                title: const Text('Pagi'),
                value: 'Pagi',
                groupValue: _sesi,
                onChanged: (value) {
                  setState(() {
                    _sesi = value!;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Siang'),
                value: 'Siang',
                groupValue: _sesi,
                onChanged: (value) {
                  setState(() {
                    _sesi = value!;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Sore'),
                value: 'Sore',
                groupValue: _sesi,
                onChanged: (value) {
                  setState(() {
                    _sesi = value!;
                  });
                },
              ),

              const SizedBox(height: 12),

              // Persetujuan penggunaan data
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                controlAffinity:
                    ListTileControlAffinity.leading,
                value: _setuju,
                onChanged: (value) {
                  setState(() {
                    _setuju = value ?? false;
                  });
                },
                title: const Text(
                  'Saya menyetujui penggunaan data pribadi '
                  'untuk keperluan pengajuan layanan.',
                ),
              ),

              const SizedBox(height: 24),

              // Tombol kirim
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:
                      _loading ? null : _kirimPengajuan,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff087cf0),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                  ),
                  child: _loading
                      ? const SizedBox(
                          height: 22,
                          width: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text('Kirim Pengajuan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
