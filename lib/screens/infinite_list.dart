import 'package:flutter/material.dart';
import 'package:practica3_5a/screens/home_screen.dart';
import 'package:practica3_5a/screens/images_screen.dart';
import 'package:practica3_5a/screens/inputs.dart';
import 'package:practica3_5a/screens/notifications.dart';
import 'package:practica3_5a/theme/app_theme.dart';

class InfiniteList extends StatefulWidget {
  const InfiniteList({super.key});

  @override
  State<InfiniteList> createState() => _InfiniteListState();
}

class _InfiniteListState extends State<InfiniteList> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista Infinita'),
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
                Icons.notifications,
                color: AppTheme.backColor,
              ),
              label: 'Notificaciones',
            ),
            BottomNavigationBarItem(
              backgroundColor: AppTheme.primaryColor,
              icon: Icon(
                Icons.image,
                color: AppTheme.backColor,
              ),
              label: 'Imagenes',
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
        ruta = MaterialPageRoute(builder: (context) => const Notifications());
        break;
      case 3:
        ruta = MaterialPageRoute(builder: (context) => const ImageScreen());
        break;
    }
    setState(() {
      selectedIndex = index;
      Navigator.push(context, ruta);
    });
  }
}
