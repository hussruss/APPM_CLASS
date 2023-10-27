class CuentaBancaria {
  double _saldo = 0.0;

  CuentaBancaria() {}

  double get saldo => _saldo;
  //set saldo(double value) => _saldo = value;

  void realizarDeposito(double value) {
    _saldo += value;
  }

  void realizarRetiro(double value) {
    if (_saldo >= value) {
      _saldo -= value;
    } else {
      print("Saldo insuficiente");
    }
  }
}
