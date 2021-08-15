import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
        body: Center(child: Text('HOME'),),
      ),
    );
  }
}

void requestPerguntas(){
  
}