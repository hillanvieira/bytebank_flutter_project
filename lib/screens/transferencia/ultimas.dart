import 'package:bytebank/models/transferencias.dart';
import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final titulo = 'Ultimas transferencias';

class UltimasTranferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          titulo,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Consumer<Transferencias>(
          builder: (context, listaTransferencias, child) {
            if (listaTransferencias.tranferencias.length == 0) {
              return SemTransferenciaCadastrada();
            } else {
              return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: validaQuantidadeItem(
                    listaTransferencias.tranferencias.length),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final transferencia = listaTransferencias.tranferencias[
                      listaTransferencias.tranferencias.length - (index + 1)];

                  return ItemTransferencia(transferencia);
                },
              );
            }
          },
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return ListaTransferencia();
              },
            ));
          },
          child: Text('Ver Todas Transferências'),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
        ),
      ],
    );
  }

  int validaQuantidadeItem(int tamanhoLista) {
    if (tamanhoLista <= 2) {
      return tamanhoLista;
    } else {
      return 2;
    }
  }
}

class SemTransferenciaCadastrada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(40),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          'Sem transferências',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
