import 'package:flutter/material.dart';
import 'package:quiz/app/questionario/questao.dart';
import 'package:quiz/app/questionario/resposta.dart';

class Questionario extends StatelessWidget {
  const Questionario(
      {required this.perguntas,
      required this.perguntaSelecionada,
      required this.responder});

  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'].toString(),
            () => responder(int.parse(resp['pontuacao'].toString())),
          );
        }).toList(),
      ],
    );
  }
}
