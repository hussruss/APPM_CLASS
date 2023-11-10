Future<String> getName() {
  return Future.delayed(Duration(seconds: 3), () {
    return 'Juan';
  });
}

Future<String> getLastName() {
  return Future.delayed(Duration(seconds: 5), () {
    return 'Lopez';
  });
}

class Person {
  String? name;
  Person({this.name});
}

void main() async {
  int? num = null;
  num ??= 5;
  print(num);

  int? num1 = 10;
  num1 ??= 5;
  print(num1);

  Person? persona = null;

  String? namePerson = persona?.name;
  print('Persona $namePerson');

  String? name = 'Juan';
  String secondName = name ?? "Invitado";
  print('Hola $secondName');

  try {
    List<int> list = [1, 2, 3];
    int valor = list[5];
    print("El valor es $valor");
  } catch (error) {
    print('Errorrr : $error');
  } finally {
    print('Fin');
  }

  try {
    List<String> result = await Future.wait([getName(), getLastName()]);
    print('Nombre completo : $result[0] $result[2]');
  } catch (error) {
    print('Errorrr : $error');
  }
}
