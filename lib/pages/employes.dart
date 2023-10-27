import 'package:flutter/material.dart';
import 'package:m1_s4/models/employes.dart';

class Employes extends StatefulWidget {
  @override
  State<Employes> createState() => _EmployesState();
}

class _EmployesState extends State<Employes> {
  List<Employe> employes = [];
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Employe? _employe;
  String _language = '';
  String _tools = '';

  EmployesType? _employeType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro de empleados')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Title(),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Nombre'),
                        onSaved: (value) {
                          // if()
                          setState(() {
                            _employe!.name = value!;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'El campo es obligatorío';
                          }
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Edad'),
                        keyboardType: TextInputType.number,
                        onSaved: (value) {
                          setState(() {
                            _employe!.age = int.parse(value!);
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'El campo es obligatorío';
                          }
                        },
                      ),
                      DropdownButton<EmployesType>(
                          value: _employeType,
                          items: const [
                            DropdownMenuItem(
                              value: EmployesType.development,
                              child: Text('Desarrollador'),
                            ),
                            DropdownMenuItem(
                              value: EmployesType.designer,
                              child: Text('Diseñador'),
                            )
                          ],
                          onChanged: (EmployesType? value) {
                            setState(() {
                              _employeType = value;
                            });
                          }),
                      if (_employeType == EmployesType.development)
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Lenguaje de programación'),
                          onSaved: (value) {
                            setState(() {
                              _language = value!;
                            });
                          },
                        ),
                      if (_employeType == EmployesType.designer)
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Herramienta'),
                          onSaved: (value) {
                            setState(() {
                              _tools = value!;
                            });
                          },
                        ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            _formKey.currentState!.save();
                            print(_employeType);

                            if (_employeType == EmployesType.development) {
                              if (_language.isNotEmpty) {
                                print(_language);
                                Development development = Development(
                                    name: _employe!.name,
                                    age: _employe!.age,
                                    language: _language);
                                setState(() {
                                  employes.add(development);
                                  _formKey.currentState!.reset();
                                });
                              }
                            }

                            if (_employeType == EmployesType.designer) {
                              if (_tools.isNotEmpty) {
                                Designger designger = Designger(
                                    name: _employe!.name,
                                    age: _employe!.age,
                                    tools: _tools);
                                setState(() {
                                  employes.add(designger);
                                  _formKey.currentState!.reset();
                                });
                              }
                            }
                            print(employes);
                          },
                          child: Text('AgregarEmpleado')),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              _buildEmployedListTitle(),
              _buildEmployeList()
            ],
          ),
        ),
      ),
    );
  }

  Text _buildEmployedListTitle() {
    return const Text(
      'Lista Empleados',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Container _buildEmployeList() {
    return Container(
        height: 400,
        child: ListView.builder(
          itemCount: employes.length,
          itemBuilder: (context, index) {
            Employe employe = employes[index];

            if (employe is Development) {
              return ListTile(
                title: Text(employe.name),
                subtitle: Text('Desarrollador'),
                trailing: Text('Lenguaje : ${employe.language}'),
              );
            }

            if (employe is Designger) {
              return ListTile(
                title: Text(employe.name),
                subtitle: Text('Diseñador'),
                trailing: Text('Herramienta : ${employe.tools}'),
              );
            }
          },
        ));
  }
}

class Title extends StatelessWidget {
  const Title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Registrar Empleados',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
