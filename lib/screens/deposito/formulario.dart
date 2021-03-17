import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/saldo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _tituloAppBar = 'Receber depósito';
const _dicaCampoValor = 'R\$00.00';
const _textoBotaoConfirmar = 'Confirma';
const _rotuloCampoValor = 'Valor';

class FormularioDeposito extends StatelessWidget {
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                dica: _dicaCampoValor,
                controlador: _controladorCampoValor,
                rotulo: _rotuloCampoValor,
                icone: Icons.monetization_on,
              ),
              ElevatedButton(
                child: Text(_textoBotaoConfirmar),
                onPressed: () => _criaDeposito(context),
              )
            ],
          ),
        ));
  }

  _criaDeposito(BuildContext context) {
    final double value = double.tryParse(_controladorCampoValor.text);
    final depositoValido = _validaDeposito(value);

    if(depositoValido) {
      _atualizaEstado(context, value);

      Navigator.pop(context);
    }
  }

 bool _validaDeposito(double valor){
    final _campoPreenchido = (valor != null);
    return _campoPreenchido;
  }

  _atualizaEstado(BuildContext context, double value){
  Provider.of<Saldo>(context, listen: false).adiciona(value);
  }

}
