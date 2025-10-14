import 'package:flutter/material.dart';

void main() => runApp(NombreApp());

class NombreApp extends StatelessWidget {
  const NombreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mi primera app",
      home: Inicio()
    );
  }
}


class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mi primera App"),
      ),
      body: Center(
        child: Text("Hola Mundo"),
      ),
    );
  }
}