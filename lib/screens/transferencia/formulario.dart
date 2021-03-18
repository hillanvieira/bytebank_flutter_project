import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/saldo.dart';
import 'package:bytebank/models/tranferencia.dart';
import 'package:bytebank/models/transferencias.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

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
                onPressed: () {
                  _criaTransferencia(context);
                },
              )
            ],
          ),
        ));
  }

  void _criaTransferencia(BuildContext context) async {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);
    double _saldo = Provider.of<Saldo>(context, listen: false).valor;
    if (_validaTransferencia(numeroConta, valor)) {
      final novaTransferencia = Transferencia(
        valor,
        numeroConta,
      );

      if (_saldo < valor) {
        await showDialog(
            context: context,
            builder: (context) {
              return Consumer<Saldo>(builder: (context, saldo, child) {
                return AlertDialog(
                  title:
                      Text('Saldo insuficiente', textAlign: TextAlign.center),
                  content: SizedBox(
                    height: 100,
                    child: Column(
                      children: [
                        Icon(Icons.warning_amber_outlined,
                            size: 80, color: Colors.red),
                      ],
                    ),
                  ),
                );
              });
            });

        Navigator.pop(context);
      } else {
        _atualizaEsttado(context, novaTransferencia);
      }
    }
  }

  void _atualizaEsttado(BuildContext context, Transferencia transferencia) {
    Provider.of<Transferencias>(context, listen: false).Adiciona(transferencia);
    Provider.of<Saldo>(context, listen: false).subtrai(transferencia.valor);
  }

  bool _validaTransferencia(int numeroConta, double valor) {
    return numeroConta != null && valor != null;
  }
}
