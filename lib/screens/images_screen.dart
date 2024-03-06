import 'package:flutter/material.dart';
import 'package:practica3_5a/theme/app_theme.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Imagenes',
          style: AppTheme.lightTheme.textTheme.headlineLarge,
        ),
      ),
      body: ListView(
        children: [
          imagesCard(),
          imageWeb(),
        ],
      ),
    );
  }

  Card imagesCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.all(20),
      elevation: 15,
      child: SizedBox(
        height: 600,
        width: 400,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: const Image(
                image: AssetImage('assets/img/pershing.jpg'),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Tanque EstadoUnidense de la Segunda Guerra Mundial M26 Pershing',
                style: (AppTheme.lightTheme.textTheme.headlineLarge),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget imageWeb() {
    return Center(
      child: Image.network(
        'https://okdiario.com/img/2021/04/20/curiosidades-sobre-los-gatos-domesticos-635x358.jpg',
      ),
    );
  }
}
