// void main() {
//   print('Hola');
// }

// //Función básica
// int suma(int a, int b) {
//   return a + b;
// }

// void main() {
//   int a = 200;
//   int b = 100;
//   int resultado = suma(a, b);
//   print(resultado);
// }

// //Función anónima
// var funcionAnonima = (int a, int b) {
//   return a * b;
// };

// void main() {
//   int a = 10;
//   int b = 5;
//   print(funcionAnonima(a, b));
// }

// //Función anónima
// int funcionjFlecha(int a) => a * a;

// void main() {
//   int a = 2;
//   int b = 5;
//   print(funcionjFlecha(a));
// }

// //Función de orden superior
// int operacion(int a, int b, int Function(int, int) fun) {
//   return fun(a, b);
// }

// int suma(int a, int b) {
//   return a + b;
// }

// int resta(int a, int b) {
//   return a - b;
// }

// int multi(int a, int b) {
//   return a * b;
// }

// void main() {
//   int a = 8;
//   int b = 2;
//   print(operacion(a, b, suma));
//   print(operacion(a, b, resta));
//   print(operacion(a, b, multi));
// }

// //Funciones recursivas
// int sumaRecursiva(int a) {
//   if (a <= 0) {
//     return 0;
//   } else {
//     print('parametro $a');
//     return a + sumaRecursiva(a - 1);
//   }
// }

// void main() {
//   int a = 10;
//   int b = 2;
//   print('Suma ${sumaRecursiva(a)}');
// }

// //Funciones parametro opcionales
// String mensaje(String nombre, [String saludo = 'Hola']) {
//   return '$saludo $nombre';
// }

// void main() {
//   String nombre = 'Victor';
//   String saludo = 'Buen día,';
//   print(mensaje(nombre));
//   print(mensaje(nombre, saludo));
// }

// //Funciones parametro opcionales
// String mensaje(
//     {required String nombre, String saludo = 'Hola', String apellido = ''}) {
//   return '$saludo $nombre $apellido';
// }

// void main() {
//   String nombre = 'Victor';
//   String apellido = 'Rojas';
//   String saludo = 'Buen día,';
//   print(mensaje(nombre: nombre));
//   print(mensaje(nombre: nombre, saludo: saludo, apellido: apellido));
// }

// abstract class Vehiculo {
//   //Atributos
//   final String marca;
//   final String modelo;
//   final String color;

//   //Constructor
//   Vehiculo(this.marca, this.modelo, this.color);

//   //Métodos
//   void arrancar() {
//     print('$marca $modelo arrancando...');
//   }

//   void pitarVehiculo(String color) {
//     print('Pintando vehiculo a $color');
//     color = color;
//     print('Ahora el color del vehiculo es $color');
//   }
// }

// class Moto extends Vehiculo {
//   Moto(String marca, String modelo, String color) : super(marca, modelo, color);

//   //Métodos
//   @override
//   void arrancar() {
//     print('$marca $modelo arrancando moto...');
//   }
// }

// class Coche extends Vehiculo {
//   final int puertas;

//   Coche(String marca, String modelo, String color, int this.puertas)
//       : super(marca, modelo, color);

//   //Métodos
//   @override
//   void arrancar() {
//     print('$marca $modelo arrancando auto... ');
//   }
// }

// class Bici extends Vehiculo {
//   final int llantas;

//   Bici(String marca, String modelo, String color, int this.llantas)
//       : super(marca, modelo, color);

//   //Métodos
//   @override
//   void arrancar() {
//     print('$marca $modelo arrancando bici... ');
//   }
// }

// void main() {
//   //Creart objetos
//   Vehiculo miCarro = Coche('Ford', 'Mustang', 'Rojo', 3);
//   Vehiculo carroRoger = Coche('Tesla', 'Cyber Truck', 'Gris', 2);
//   Vehiculo motoXavi = Moto('Yamaha', 'x', 'Roja');

//   miCarro.arrancar();
//   carroRoger.arrancar();
//   motoXavi.arrancar();

//   print(
//       'El carro de Roger es un ${carroRoger.marca} - ${carroRoger.modelo} color ${carroRoger.color}');

//   miCarro.pitarVehiculo('Verde');
//   carroRoger.pitarVehiculo('Negro');
//   motoXavi.pitarVehiculo('Blanco');
// }

// abstract class Animal {
//   final String nombre;

//   Animal(this.nombre);

//   //Getter y Setters
//   String get nombreAnimal => nombre;

//   void darDeComer() {
//     print('Ahora el animal $nombre está comiendo ');
//   }
// }

// class Perro {
//   final String nombre;
//   String _raza;
//   Perro(this.nombre, this._raza);

//   //Getter y Setters
//   String get getRaza => _raza;
//   set setRaza(String r) {
//     _raza = r;
//   }
// }

// class Gato extends Animal {
//   Gato(nombre) : super(nombre);
// }

// void main() {
//   Perro firulais = Perro('Firulais', 'Pitbull');
//   Animal michi = Gato('Michi');
//   michi.darDeComer();

//   print(michi.nombreAnimal);
//   print(firulais.getRaza);
//   firulais.setRaza = 'Chihuahua';

//   print(firulais.getRaza);
// }

// class Heroe {
//   //Atributos
//   String nombre;
//   String poder;

//   //Contructor
//   Heroe({required this.nombre, required this.poder});

//   //Métodos
//   String saludo() {
//     return 'Hola soy $nombre y mi poder es $poder';
//   }

//   //Factory
//   factory Heroe.fromMap(Map<String, dynamic> map) {
//     return Heroe(nombre: map['name'], poder: map['power']);
//   }
// }

// void main() {
//   Heroe ironMan = Heroe(nombre: 'IronMan', poder: 'Inteligencia');
//   Heroe batman = Heroe(nombre: 'Batman', poder: 'Dinero');
//   Heroe thor = Heroe(nombre: 'Thor', poder: 'Fuerza y martillo');

//   print(ironMan.saludo());
//   print(batman.saludo());
//   print(thor.saludo());

//   Map<String, dynamic> heroMap = {
//     'name': 'Capitan America',
//     'power': 'Fuerza y escudo'
//   };

//   Heroe capitanAmerica = Heroe.fromMap(heroMap);
//   print(capitanAmerica.saludo());
// }

// class Animal {
//   String nombre;
//   Animal(this.nombre);

//   void hacerSonido() {
//     print('El Animal hace un sonido ...');
//   }
// }

// class AnimalQuePuedeVolar {
//   AnimalQuePuedeVolar();

//   void hacerSonido() {
//     print('El Animal hace un sonido ...');
//   }
// }

// class AveQuepuedenVolar extends Animal with PuedeVolar {
//   AveQuepuedenVolar(String nombre) : super(nombre);
// }

// class AveQueNopuedenVolar extends Animal {
//   AveQueNopuedenVolar(String nombre) : super(nombre);
// }

// mixin PuedeVolar {
//   void pudeVolar() {
//     print('El animal está volando');
//   }
// }

// void main() {
//   AveQuepuedenVolar aguila = AveQuepuedenVolar('Águila');
//   AveQueNopuedenVolar avestruz = AveQueNopuedenVolar('Avestruz');
//   aguila.hacerSonido();
//   aguila.pudeVolar();
//   avestruz.hacerSonido();
// }
