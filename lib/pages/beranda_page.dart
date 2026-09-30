import 'package:flutter/material.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Icon(
            Icons.location_city,
            size: 80,
            color: Color(0xff087cf0),
          ),

          const SizedBox(height: 20),

          const Text(
            'Nusantara Cerdas',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xff172554),
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            'Ringkasan Enam Pilar Smart City',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 25),

          // Smart Governance
          _pilar(
            Icons.account_balance,
            'Smart Governance',
            'Pelayanan pemerintahan yang mudah dan transparan.',
          ),

          const SizedBox(height: 12),

          // Smart Branding
          _pilar(
            Icons.campaign,
            'Smart Branding',
            'Membangun identitas dan daya tarik kota.',
          ),

          const SizedBox(height: 12),

          // Smart Economy
          _pilar(
            Icons.trending_up,
            'Smart Economy',
            'Mendorong pertumbuhan ekonomi dan usaha masyarakat.',
          ),

          const SizedBox(height: 12),

          // Smart Living
          _pilar(
            Icons.home,
            'Smart Living',
            'Meningkatkan kenyamanan dan kualitas hidup warga.',
          ),

          const SizedBox(height: 12),

          // Smart Society
          _pilar(
            Icons.groups,
            'Smart Society',
            'Mendorong masyarakat yang aktif dan saling terhubung.',
          ),

          const SizedBox(height: 12),

          // Smart Environment
          _pilar(
            Icons.eco,
            'Smart Environment',
            'Mendukung lingkungan kota yang bersih dan berkelanjutan.',
          ),
        ],
      ),
    );
  }

  static Widget _pilar(
    IconData icon,
    String title,
    String description,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xffe8f2ff),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: const Color(0xff087cf0),
              size: 28,
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff172554),
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}