
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/pengajuan_cubit.dart';

class DetailLayananPage extends StatefulWidget {
  final String namaLayanan;
  final String dinas;
  final String jam;
  final String keterangan;

  const DetailLayananPage({
    super.key,
    required this.namaLayanan,
    required this.dinas,
    required this.jam,
    required this.keterangan,
  });

  @override
  State<DetailLayananPage> createState() =>
      _DetailLayananPageState();
}

class _DetailLayananPageState extends State<DetailLayananPage> {
  bool sedangMengirim = false;

  Future<void> ajukanPermohonan() async {
    if (sedangMengirim) return;

    setState(() {
      sedangMengirim = true;
    });

    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;

    context
        .read<PengajuanCubit>()
        .tambahPengajuan(widget.namaLayanan);

    Navigator.pop(
      context,
      'Permohonan ${widget.namaLayanan} telah diajukan',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Layanan'),
        backgroundColor: const Color(0xff087cf0),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.namaLayanan,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),

            const Text(
              'Dinas Penanggung Jawab',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 5),
            Text(
              widget.dinas,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              'Jam Operasional',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 5),
            Text(
              widget.jam,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              'Keterangan',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 5),
            Text(
              widget.keterangan,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed:
                    sedangMengirim ? null : ajukanPermohonan,
                child: sedangMengirim
                    ? const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          ),
                          SizedBox(width: 12),
                          Text('Mengirim...'),
                        ],
                      )
                    : const Text('Ajukan Permohonan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
