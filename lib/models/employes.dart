enum EmployesType { development, designer }

class Employe {
  String name;
  int age;

  Employe({required this.name, required this.age});
}

class Development extends Employe {
  String language;
  Development({required name, required age, required this.language})
      : super(name: name, age: age);
}

class Designger extends Employe {
  String tools;
  Designger({required name, required age, required this.tools})
      : super(name: name, age: age);
}







// class Casa {
//   int numHabitaciones;
//   double tamanoTerreno;
//   String materialesDeConstruccion;
  

//   Casa(this.numHabitaciones, this.tamanoTerreno, this.materialesDeConstruccion);
  
//   int getNumHabitaciones(){
//     return numHabitaciones;
//   }
  
//   double getTamanoTerreno(){
//     return tamanoTerreno;
//   }
    
//   String getMaterialesDeConstruccion(){
//     return materialesDeConstruccion;
//   }
  
// }

// void main(){
  
//   Casa miCasa = Casa(2, 80.5, "Ladrillos");
  
//   print('Habitaciones: ${miCasa.numHabitaciones}');
//   print('Tamaño m2: ${miCasa.tamanoTerreno}');
//   print('Material: ${miCasa.materialesDeConstruccion}');
// }