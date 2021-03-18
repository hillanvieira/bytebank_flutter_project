import 'package:bytebank/models/tranferencia.dart';
import 'package:flutter/cupertino.dart';

class Transferencias extends ChangeNotifier{
  final List<Transferencia> _tranferencias = [];

  List<Transferencia> get tranferencias => _tranferencias;

  void Adiciona(Transferencia novaTransferencia){
    tranferencias.add(novaTransferencia);

    notifyListeners();
  }
}