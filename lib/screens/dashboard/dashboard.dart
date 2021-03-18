import 'package:bytebank/models/saldo.dart';
import 'package:bytebank/screens/dashboard/saldo.dart';
import 'package:bytebank/screens/deposito/formulario.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bytebank'),
      ),
      body: ListView(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SaldoCard(),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return FormularioDeposito();
                    },
                  ));
                },
                child: Text('Receber depósito'),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return FormularioTransferencia();
                    },
                  ));
                },
                child: Text('Nova Transferência'),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
