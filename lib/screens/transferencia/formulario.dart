import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/tranferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transferência';
const _rotuloCampoValor = "valor";
const _dicaCampoValor = "0.00";
const _dicaCampoConta = '0000';
const _rotuloCampoConta = 'Número da conta';
const _textoBotaoConfirmar = "confirmar";

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
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
                controlador: _controladorCampoNumeroConta,
                dica: _dicaCampoConta,
                rotulo: _rotuloCampoConta,
                icone: Icons.account_balance,
              ),
              Editor(
                dica: _dicaCampoValor,
                controlador: _controladorCampoValor,
                rotulo: _rotuloCampoValor,
                icone: Icons.monetization_on,
              ),
              ElevatedButton(
                child: Text(_textoBotaoConfirmar),
                onPressed: () => _criaTransferencia(context),
              )
            ],
          ),
        ));
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(
        valor,
        numeroConta,
      );
      //debugPrint("Criando Transferencia");
      //debugPrint('$transferenciaCriada');
      Navigator.pop(
        context,
        transferenciaCriada,
      );
    }
  }
}
