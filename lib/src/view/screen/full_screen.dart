import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

class FullScreen extends StatelessWidget {
  const FullScreen({required this.path, Key? key}) : super(key: key);
  final String path;

  @override
  Widget build(BuildContext context) {
    final File image = File(path);
    final String name = path.split('/').last;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(name, style: const TextStyle(color: Colors.white)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: PinchZoom(
        resetDuration: const Duration(microseconds: 100),
        maxScale: 2.5,
        child: Center(
          child: Hero(
            tag: path,
            child: Image.file(image),
          ),
        ),
      ),
    );
  }
}
