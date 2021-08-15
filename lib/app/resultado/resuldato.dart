import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  const Resultado(this.resultadoFinal, this.quadoReiniciarQuestionario);
  final int resultadoFinal;
  final void Function() quadoReiniciarQuestionario;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            "Resultado: $resultadoFinal pts!",
            style: TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
            elevation: 15,
            shadowColor: Colors.black),
          onPressed: quadoReiniciarQuestionario,
          child: Text("Reiniciar ?",style: TextStyle(fontSize: 18,color: Colors.white)),
        )
      ],
    );
  }
}
