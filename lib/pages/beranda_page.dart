import 'package:flutter/material.dart';

class HalamanBeranda extends StatelessWidget {
  const HalamanBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Nusantara Cerdas',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 25),

          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.95,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _pilar(
                Icons.account_balance,
                'Smart Governance',
                'Pelayanan pemerintahan yang mudah dan transparan.',
              ),

              _pilar(
                Icons.trending_up,
                'Smart Economy',
                'Mendorong pertumbuhan ekonomi dan usaha masyarakat.',
              ),

              _pilar(
                Icons.eco,
                'Smart Environment',
                'Menjaga lingkungan kota yang bersih dan berkelanjutan.',
              ),

              _pilar(
                Icons.home,
                'Smart Living',
                'Meningkatkan kenyamanan dan kualitas hidup warga.',
              ),

              _pilar(
                Icons.groups,
                'Smart People',
                'Mendorong masyarakat yang aktif dan saling terhubung.',
              ),

              _pilar(
                Icons.directions_bus,
                'Smart Mobility',
                'Mendukung mobilitas perkotaan.',
              ),
            ],
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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xfff8f8fc),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 30,
            color: Colors.black87,
          ),

          const SizedBox(height: 16),

          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Expanded(
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 13,
                height: 1.4,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}