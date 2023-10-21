import 'dart:math';

class Question {
  String text;
  bool response;

  Question({required this.text, required this.response});

  bool isCorrect(bool value) => response == value;
}

List<Question> questions = [
  Question(text: 'El Sol es una estrella.', response: true),
  Question(text: 'El agua hierve a 100 grados Celsius.', response: true),
  Question(text: 'La Luna es un planeta.', response: false),
  Question(text: 'La Tierra es plana.', response: false),
  Question(text: 'El ser humano tiene 2 piernas.', response: true),
  Question(text: 'El perro es un mamífero.', response: true),
  Question(
      text: 'La suma de los ángulos internos de un triángulo es 180 grados.',
      response: true),
  Question(text: 'El hierro es un elemento químico líquido.', response: false),
  Question(
      text: 'El código de barras fue inventado en los años 1920.',
      response: false),
  Question(text: 'La luz viaja más rápido que el sonido.', response: true),
];

class Task {
  String name;
  String description;
  DateTime date;
  Task(this.name, this.description, this.date);
}

class Person {
  String id;
  String name;
  int age;
  String city;
  String gender;

  Person({
    required this.id,
    required this.name,
    required this.age,
    required this.city,
    this.gender = 'N',
  });

  void eat() {
    print('$name está comiendo');
  }

  void study() {
    print('$name está estudiando');
  }

  void sleep() {
    print('$name está durmiendo');
  }

  void play() {
    print('$name está jugando');
  }
}

void main() {
  Task task1 = Task('Tarea 1', 'Descripción', DateTime(2023, 10, 14));

  print('Nombre: ${task1.name}');
  print('Descripción: ${task1.description}');
  print('Fecha: ${task1.date}');

  Person roger =
      Person(id: '1', name: 'Rogelio', age: 22, city: "CDMX", gender: "M");
  Person brayan =
      Person(id: '2', name: 'Brayan', age: 23, city: "Bogotá", gender: "M");

  roger.study();
  print("${brayan.city}");
  brayan.eat();
}

class Car {
  String brand;
  String model;
  int year;
  double velocity;

  Car(
      {required this.brand,
      required this.model,
      required this.year,
      this.velocity = 0.0});

  void acelerate() {
    velocity += 10;
    print('El auto está acelerando. Valocidad actual $velocity km/h');
  }

  void brake() {
    velocity -= 10;
    print('El auto está frenando. Valocidad actual $velocity km/h');
  }
}


// void main(){
//   print('Hola');
  
//   Car miCarro = Car(brand: 'Tesla', model: 'CyberTruck', year: 2020);
  
//   miCarro.acelerate();
//   miCarro.acelerate();
//   miCarro.acelerate();
//   miCarro.brake();
//   miCarro.brake();
//   miCarro.brake();

  
// }