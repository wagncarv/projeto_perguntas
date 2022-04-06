import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

void main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      {
        'texto': 'Qual é a sua cor favorita?',
        'respostas': ['Branco', 'Preto', 'Verde', 'Vermelho']
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'respostas': ['Cobra', 'Coelho', 'Elefante', 'Leão']
      },
      {
        'texto': 'Qual é o seu instrutor favorito?',
        'respostas': ['Gustavo', 'Loiane', 'Micheli', 'Rafael']
      },
    ];

    final listaRespostas = perguntas[_perguntaSelecionada].cast()['respostas'];
    List<Widget> respostas = [];
    for (String resposta in listaRespostas) {
      respostas.add(Resposta(resposta, _responder));
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: [
            Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
            ...respostas,
          ],
        ),
      ),
      // )
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
