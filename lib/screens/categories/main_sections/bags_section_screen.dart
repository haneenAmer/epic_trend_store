import 'package:flutter/material.dart';

class BagsSectionScreen extends StatefulWidget {
  const BagsSectionScreen({super.key});

  @override
  State<BagsSectionScreen> createState() => _BagsSectionScreenState();
}

class _BagsSectionScreenState extends State<BagsSectionScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('bags section'),),
    );
  }
}