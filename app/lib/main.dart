import 'package:app/features/home/views/home_page.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

late CameraDescription firstCamera;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  firstCamera = cameras.first;
  runApp(const SeeFood());
}

class SeeFood extends StatelessWidget {
  const SeeFood({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HomePage());
  }
}
