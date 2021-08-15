import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  Resposta(this.texto, this.quandoSelecionado);

  String texto;
  
  final void Function() quandoSelecionado;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
            elevation: 15,
            shadowColor: Colors.black),
        onPressed: quandoSelecionado,
        child: Text(
          texto,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
