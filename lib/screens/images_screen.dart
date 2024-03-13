import 'package:flutter/material.dart';
import 'package:practica3_5a/screens/home_screen.dart';
import 'package:practica3_5a/screens/infinite_list.dart';
import 'package:practica3_5a/screens/inputs.dart';
import 'package:practica3_5a/screens/notifications.dart';
import 'package:practica3_5a/theme/app_theme.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Imagenes',
        ),
      ),
      body: ListView(
        children: [
          imagesCard(),
          imageWeb(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) => openScreen(context, index),
          backgroundColor: AppTheme.backColor,
          items: const [
            BottomNavigationBarItem(
              backgroundColor: AppTheme.primaryColor,
              icon: Icon(
                Icons.home,
                color: AppTheme.backColor,
              ),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              backgroundColor: AppTheme.primaryColor,
              icon: Icon(
                Icons.input_rounded,
                color: AppTheme.backColor,
              ),
              label: 'Entradas',
            ),
            BottomNavigationBarItem(
              backgroundColor: AppTheme.primaryColor,
              icon: Icon(
                Icons.list,
                color: AppTheme.backColor,
              ),
              label: 'Lista',
            ),
            BottomNavigationBarItem(
              backgroundColor: AppTheme.primaryColor,
              icon: Icon(
                Icons.notifications,
                color: AppTheme.backColor,
              ),
              label: 'Notificaciones',
            ),
            BottomNavigationBarItem(
              backgroundColor: AppTheme.secondaryColor,
              icon: Icon(
                Icons.exit_to_app,
                color: AppTheme.backColor,
              ),
              label: 'Salir',
            )
          ]),
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

  openScreen(BuildContext context, int index) {
    // valor por default de ruta
    MaterialPageRoute ruta =
        MaterialPageRoute(builder: (context) => const HomeScreen());
    switch (index) {
      case 0:
        ruta = MaterialPageRoute(builder: (context) => const HomeScreen());
        break;
      case 1:
        ruta = MaterialPageRoute(builder: (context) => const Inputs());
        break;
      case 2:
        ruta = MaterialPageRoute(builder: (context) => const InfiniteList());
        break;
      case 3:
        ruta = MaterialPageRoute(builder: (context) => const Notifications());
        break;
    }
    setState(() {
      selectedIndex = index;
      Navigator.push(context, ruta);
    });
  }

  Widget imageWeb() {
    return Center(
      child: Image.network(
        'https://okdiario.com/img/2021/04/20/curiosidades-sobre-los-gatos-domesticos-635x358.jpg',
      ),
    );
  }
}
