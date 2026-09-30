import 'package:flutter/material.dart';

class TentangPage extends StatelessWidget {
  const TentangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Aplikasi'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.location_city,
              size: 70,
              color: Color(0xff087cf0),
            ),

            SizedBox(height: 20),

            Text(
              'Nusantara Cerdas Mobile',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            Text(
              'Aplikasi layanan warga Smart City '
              'Nusantara Cerdas.',
            ),
          ],
        ),
      ),
    );
  }
}