import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Settings'),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
      ),
      body: const Center(
        child: Text(
          'Settings Page',
          style: cinemaHeaderStyle,
        ),
      ),
    );
  }
}