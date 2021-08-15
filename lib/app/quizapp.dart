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
    return _perguntaSelecionada < _perguntas.length;
  }

  Future<List<Map<String, Object>>> getPerguntas() async {
    var url =
        Uri.https('http://localhost:5000', '/perguntass', {'q': '{http}'});

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var perguntas = convert.jsonDecode(response.body);
      return perguntas;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      var perguntas = const [
        {
          'texto': 'Qual a sua cor favorita?',
          'respostas': [
            {'texto': 'Azul', 'pontuacao': 10},
            {'texto': 'Verde', 'pontuacao': 10},
            {'texto': 'Preto', 'pontuacao': 10},
          ]
        },
        {
          'texto': 'Qual o seu animal favorito?',
          'respostas': [
            {'texto': 'Cão', 'pontuacao': 10},
            {'texto': 'Gato', 'pontuacao': 10},
            {'texto': 'Passáro', 'pontuacao': 10}
          ]
        },
      ];
      return perguntas;
    }
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
