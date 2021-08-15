import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  Questao(this.texto);

  final String texto;

  //perguntas[_perguntaSlecionada]

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        texto,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
