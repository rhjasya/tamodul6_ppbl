
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class LokasiKantorPage extends StatelessWidget {
  const LokasiKantorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lokasi Kantor'),
      ),
      body: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(-6.9175, 107.6191),
          initialZoom: 14,
        ),
        children: [
          TileLayer(
            urlTemplate:
                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.nusantara_cerdas',
          ),
          const MarkerLayer(
            markers: [
              Marker(
                point: LatLng(-6.9175, 107.6191),
                width: 50,
                height: 50,
                child: Icon(
                  Icons.location_pin,
                  color: Colors.red,
                  size: 40,
                ),
              ),
            ],
          ),
          RichAttributionWidget(
            attributions: [
              TextSourceAttribution('OpenStreetMap contributors'),
            ],
          ),
        ],
      ),
    );
  }
}
