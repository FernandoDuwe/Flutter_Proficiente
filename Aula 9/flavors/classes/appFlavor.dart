import 'package:flutter/material.dart';

class AppFlavor {
  late String title;
  late Color backgroundColor;
  late String welcomeText;
  late Icon homeIcon;
  late bool enviarEmail = false;
  late bool pedidosOnline = false;
  late bool appInTest = false;

  AppFlavor.HardwareStore() {
    this.title = "Autopeças do Beto";
    this.backgroundColor = Colors.white;
    this.welcomeText = "Quer peças para carros? Compre com o Beto!";
    this.homeIcon = Icon(Icons.hardware, size: 128, color: Colors.orange,);
    this.enviarEmail = true;
  }

  AppFlavor.CupcakeStore() {
    this.title = "Cupcakes gatinhos fofinhos";
    this.backgroundColor = Colors.pinkAccent;
    this.welcomeText = "Os cupcakes mais saborosos da região ;)";
    this.homeIcon = Icon(Icons.star, size: 128, color: Colors.white,);
    pedidosOnline = true;
  }

  AppFlavor.DevMode() {
    this.title = "Loja de Debug";
    this.backgroundColor = Colors.white;
    this.welcomeText = "App de teste... não liberar";
    this.homeIcon = Icon(Icons.device_hub, size: 128, color: Colors.blueAccent);
    pedidosOnline = true;
    enviarEmail = true;
    appInTest = true;
  }
}