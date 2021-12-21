// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unnecessary_this
import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _escolhaDoApp = AssetImage("img/padrao.png");

  var _resultado = "Escolha uma opção abaixo";

  var _pedra = Image.asset("img/pedra.png", height: 100);
  var _papel = Image.asset("img/papel.png", height: 100);
  var _tesoura = Image.asset("img/tesoura.png", height: 100);

  void _calculaResultado(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(opcoes.length);
    var escolhaApp = opcoes[numero];

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._escolhaDoApp = AssetImage("img/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._escolhaDoApp = AssetImage("img/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._escolhaDoApp = AssetImage("img/tesoura.png");
        });
        break;
    }

    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel")) {
      setState(() {
        _resultado = "Você venceu! :)";
      });
    } else if ((escolhaUsuario == "pedra" && escolhaApp == "pedra") ||
        (escolhaUsuario == "papel" && escolhaApp == "papel") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "tesoura")) {
      setState(() {
        _resultado = "Empate";
      });
    } else {
      setState(() {
        _resultado = "Você perdeu! :(";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 25, bottom: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // texto 1
              Text(
                "Escolha do App:",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // imagem escolhida pela maquina
              Image(image: this._escolhaDoApp),

              // texto 2
              Text(
                _resultado,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // opções de escolha
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                        onTap: () => _calculaResultado("pedra"), child: _pedra),
                    GestureDetector(
                        onTap: () => _calculaResultado("papel"), child: _papel),
                    GestureDetector(
                        onTap: () => _calculaResultado("tesoura"),
                        child: _tesoura),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
