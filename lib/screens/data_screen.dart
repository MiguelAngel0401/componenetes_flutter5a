import 'package:flutter/material.dart';
import 'package:practica3_5a/models/data.dart';
import 'package:practica3_5a/screens/home_screen.dart';
import 'package:practica3_5a/screens/images_screen.dart';
import 'package:practica3_5a/screens/infinite_list.dart';
import 'package:practica3_5a/screens/notifications.dart';
import 'package:practica3_5a/theme/app_theme.dart';

class DataScreens extends StatefulWidget {
  final Data datos;
  const DataScreens({super.key, required this.datos});

  @override
  State<DataScreens> createState() => _DataScreensState();
}

class _DataScreensState extends State<DataScreens> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Screen'),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              entradaTexto(),
              entradaTexto1(),
              entradaTexto2(),
              entradaTexto3(),
              entradaTexto4(),
            ],
          ),
        ),
      ]),
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
                Icons.input_rounded,
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
        ruta = MaterialPageRoute(builder: (context) => const InfiniteList());
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

  TextField entradaTexto() {
    return TextField(
      style: AppTheme.lightTheme.textTheme.headlineLarge,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: 'Escribe tu Nombre: ',
        labelStyle: AppTheme.lightTheme.textTheme.headlineLarge,
      ),
    );
  }

  TextField entradaTexto1() {
    return TextField(
      style: AppTheme.lightTheme.textTheme.headlineLarge,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: 'Te gusta Flutter? ',
        labelStyle: AppTheme.lightTheme.textTheme.headlineLarge,
      ),
    );
  }

  TextField entradaTexto2() {
    return TextField(
      style: AppTheme.lightTheme.textTheme.headlineLarge,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: 'Que tanto te gusta Flutter? ',
        labelStyle: AppTheme.lightTheme.textTheme.headlineLarge,
      ),
    );
  }

  TextField entradaTexto3() {
    return TextField(
      style: AppTheme.lightTheme.textTheme.headlineLarge,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: 'Que comida prefieres? ',
        labelStyle: AppTheme.lightTheme.textTheme.headlineLarge,
      ),
    );
  }

  TextField entradaTexto4() {
    return TextField(
      style: AppTheme.lightTheme.textTheme.headlineLarge,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: 'Que postre te gusta mas? ',
        labelStyle: AppTheme.lightTheme.textTheme.headlineLarge,
      ),
    );
  }
}
