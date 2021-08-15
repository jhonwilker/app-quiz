import 'package:flutter/material.dart';
import 'package:quiz/app/resultado/resuldato.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'questionario/questionario.dart';

class QuizApp extends StatefulWidget {
  const QuizApp();
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  var _perguntas;

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuiz() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    getPerguntas();
    return _perguntaSelecionada < _perguntas.length;
  }

  void getPerguntas() async {
    var url = Uri.http('10.0.2.2:5000', '/perguntas', {'q': '{http}'});
    var response = await http.get(url);

    //if(response.statusCode == 200) {
    _perguntas = convert.jsonDecode(response.body) as Map<String, dynamic>;
    print(_perguntas);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Quiz",
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: Center(
          child: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  responder: _responder,
                )
              : Resultado(_pontuacaoTotal, _reiniciarQuiz),
        ),
      ),
    );
  }
}
