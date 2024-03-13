import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practica3_5a/models/data.dart';
import 'package:practica3_5a/screens/data_screen.dart';
import 'package:practica3_5a/screens/home_screen.dart';
import 'package:practica3_5a/screens/images_screen.dart';
import 'package:practica3_5a/screens/infinite_list.dart';
import 'package:practica3_5a/screens/notifications.dart';
import 'package:practica3_5a/theme/app_theme.dart';

class Inputs extends StatefulWidget {
  const Inputs({super.key});

  @override
  State<Inputs> createState() => _InputsState();
}

class _InputsState extends State<Inputs> {
  String? nombre;
  bool valueSwitch = false;
  double sliderValue = 0.0;
  String? foodRadio;
  bool postreCheck1 = false;
  bool postreCheck2 = false;
  bool postreCheck3 = false;
  int selectedIndex = 0; //Elemento seleccionado de la Bottom NavigationBar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Entradas',
        ),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              entradaTexto(),
              entradaSwitch(),
              entradaSlider(),
              entradasRadio(),
              Text(
                '¿Que postres te gustan?',
                style: AppTheme.lightTheme.textTheme.headlineLarge,
              ),
              entradasCheck(),
              ElevatedButton(
                onPressed: () {
                  Data data = Data(
                      nomb: nombre!,
                      flutter: valueSwitch,
                      calif: sliderValue.round(),
                      food: foodRadio!,
                      icecream: postreCheck1,
                      choco: postreCheck2,
                      cake: postreCheck2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return DataScreens(
                        datos: data,
                      );
                    }),
                  );
                },
                child: const Text(
                  'Guardar',
                ),
              )
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
        ruta = MaterialPageRoute(builder: (context) => const InfiniteList());
        break;
      case 2:
        ruta = MaterialPageRoute(builder: (context) => const Notifications());
        break;
      case 3:
        ruta = MaterialPageRoute(builder: (context) => const ImageScreen());
        break;
      case 4: //No aplicable en navegadores ni en la opcion de windows
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
    setState(() {
      selectedIndex = index;
      Navigator.push(context, ruta);
    });
  }

  TextField entradaTexto() {
    return TextField(
      style: AppTheme.lightTheme.textTheme.headlineMedium,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: 'Escribe tu Nombre: ',
        labelStyle: AppTheme.lightTheme.textTheme.headlineLarge,
      ),
      onChanged: (text) {
        nombre = text;
      },
    );
  }

  Row entradaSwitch() {
    return Row(
      children: [
        const FlutterLogo(),
        Text(
          '¿Te gusta Flutter?',
          style: AppTheme.lightTheme.textTheme.headlineLarge,
        ),
        Switch(
            value: valueSwitch,
            onChanged: (value) {
              setState(() {
                valueSwitch = value;
              });
            }),
      ],
    );
  }

  Column entradaSlider() {
    return Column(
      children: [
        Text(
          '¿Que tanto te gusta flutter?',
          style: AppTheme.lightTheme.textTheme.headlineLarge,
        ),
        Slider(
            min: 0.0,
            max: 10.0,
            value: sliderValue,
            divisions: 10,
            label: '${sliderValue.round()}',
            onChanged: (value) {
              setState(() {
                sliderValue = value;
              });
            }),
      ],
    );
  }

  Column entradasRadio() {
    return Column(
      children: [
        Text(
          '¿Que prefiere?',
          style: AppTheme.lightTheme.textTheme.headlineLarge,
        ),
        ListTile(
          title: Text(
            'Tacos al pastor',
            style: AppTheme.lightTheme.textTheme.bodySmall,
          ),
          leading: Radio(
            value: 'Tacos al pastor',
            groupValue: foodRadio,
            onChanged: (value) {
              setState(() {
                foodRadio = value!;
              });
            },
          ),
        ),
        ListTile(
          title: Text(
            'Chiles Rellenos',
            style: AppTheme.lightTheme.textTheme.bodySmall,
          ),
          leading: Radio(
            value: 'Chiles Rellenos',
            groupValue: foodRadio,
            onChanged: (value) {
              setState(() {
                foodRadio = value!;
              });
            },
          ),
        ),
      ],
    );
  }

  Row entradasCheck() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Helado',
          style: AppTheme.lightTheme.textTheme.bodySmall,
        ),
        Checkbox(
            value: postreCheck1,
            onChanged: (value) {
              setState(() {
                postreCheck1 = value!;
              });
            }),
        Text(
          'Chocoflan',
          style: AppTheme.lightTheme.textTheme.bodySmall,
        ),
        Checkbox(
            value: postreCheck2,
            onChanged: (value) {
              setState(() {
                postreCheck2 = value!;
              });
            }),
        Text(
          'Pastel',
          style: AppTheme.lightTheme.textTheme.bodySmall,
        ),
        Checkbox(
            value: postreCheck3,
            onChanged: (value) {
              setState(() {
                postreCheck3 = value!;
              });
            }),
      ],
    );
  }
}
