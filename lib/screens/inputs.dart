import 'package:flutter/material.dart';
import 'package:practica3_5a/theme/app_theme.dart';

class Inputs extends StatefulWidget {
  const Inputs({super.key});

  @override
  State<Inputs> createState() => _InputsState();
}

class _InputsState extends State<Inputs> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Ventana de entradas',
          style: AppTheme.lightTheme.textTheme.headlineLarge,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: null,
                child: Text(
                  'Regresar',
                  style: AppTheme.lightTheme.textTheme.headlineLarge,
                )),
            const ElevatedButton(onPressed: null, child: Text('DataScreen')),
          ],
        )
      ],
    );
  }
}
