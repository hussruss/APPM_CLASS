import 'package:m1_s4/models/bank_account.dart';

void main() {
  CuentaBancaria miCuenta = CuentaBancaria();
  print('Saldo ${miCuenta.saldo}');
  miCuenta.realizarDeposito(1000.00);
  print('Saldo ${miCuenta.saldo}');
  miCuenta.realizarRetiro(500.00);
  print('Saldo ${miCuenta.saldo}');
  miCuenta.realizarDeposito(4000.00);
  print('Saldo ${miCuenta.saldo}');
}

class Vehiculo {
  String marca;

  Vehiculo(this.marca);

  void arrancar() {
    print('El vehiculo está arrancando');
  }
}

class Carro extends Vehiculo {
  String modelo;

  Carro(String marca, this.modelo) : super(marca);

  @override
  void arrancar() {
    print('El carro está arrancando');
  }

  void aparcar() {
    print('El carro estáaparcando');
  }
}

class Moto extends Vehiculo {
  String tipo;

  Moto(String marca, this.tipo) : super(marca);

  @override
  void arrancar() {
    print('La moto está arrancando');
  }
}
