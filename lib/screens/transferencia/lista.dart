import 'package:bytebank/models/tranferencia.dart';
import 'package:bytebank/models/transferencias.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'formulario.dart';


class ListaTransferencia extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: Consumer<Transferencias>(
        builder:(context, listaTransferencias, child){
          return ListView.builder(
          itemCount: listaTransferencias.tranferencias.length,
          itemBuilder: (context, index) {
            final transferencia = listaTransferencias.tranferencias[index];
            return ItemTransferencia(transferencia);
          },
        );},
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          })).then((transferenciaRecebida) =>
              _atualiza(transferenciaRecebida, context));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _atualiza(Transferencia transferenciaRecebida, BuildContext context) {
    if (transferenciaRecebida != null) {
      Provider.of<Transferencias>(context, listen: false).adiciona(transferenciaRecebida);
    }
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: Icon(
            Icons.monetization_on,
            color: Colors.green,
          ),
          title: Text("R\$ ${_transferencia.valor.toString()}"),
          subtitle: Text("Conta: ${_transferencia.numeroConta.toString()}"),
        ));
  }
}