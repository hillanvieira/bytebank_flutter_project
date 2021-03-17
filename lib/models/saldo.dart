import 'package:flutter/cupertino.dart';
import 'package:sprintf/sprintf.dart';

class Saldo extends ChangeNotifier{
  double valor;

  Saldo(this.valor);
  void adiciona(double valor){
     this.valor += valor;

     notifyListeners();
  }

  void subtrai(double valor){
    this.valor -= valor;

    notifyListeners();

  }

  @override
  String toString() {
    return sprintf('R\$%.2f', [valor]);
  }
}