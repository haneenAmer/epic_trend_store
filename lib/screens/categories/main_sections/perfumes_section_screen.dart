import 'package:flutter/material.dart';

class PerfumesSectionscreen extends StatefulWidget {
  const PerfumesSectionscreen({super.key});

  @override
  State<PerfumesSectionscreen> createState() => _PerfumesSectionscreenState();
}

class _PerfumesSectionscreenState extends State<PerfumesSectionscreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('perfumes section'),),
    );
  }
}