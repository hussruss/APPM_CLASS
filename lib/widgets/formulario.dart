import 'package:flutter/material.dart';

class PersonalData {
  String name;
  String lastName;
  String genere;
  String? address;
  bool termsAndCoditions;

  PersonalData(
      {required this.name,
      required this.lastName,
      required this.genere,
      required this.address,
      required this.termsAndCoditions});
}

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  final PersonalData _personalData = PersonalData(
      name: '',
      lastName: '',
      genere: 'F',
      address: null,
      termsAndCoditions: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario cn validaciones'),
      ),
      body: Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                const Text('Formulario con validaciones'),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                      label: Text('Ingresa tu nombre')),
                  onSaved: (value) {
                    print('OnSvae Name $value');
                    setState(() {
                      _personalData.name = value!;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingresa tu nombre';
                    } else if (value == 'No') {
                      return 'El valor no puede ser NO';
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                      label: Text('Ingresa tu aperllido')),
                  onSaved: (value) {
                    print('OnSvae LastName $value');
                    setState(() {
                      _personalData.lastName = value!;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingresa tu apellido';
                    }
                  },
                ),
                Divider(),
                Text('Sabes programación?'),
                RadioListTile(
                    title: Text('Masculino'),
                    value: 'M',
                    groupValue: _personalData.genere,
                    onChanged: (value) {
                      setState(() {
                        _personalData.genere = value!;
                      });
                    }),
                RadioListTile(
                    title: Text('Femenino'),
                    value: 'F',
                    groupValue: _personalData.genere,
                    onChanged: (value) {
                      setState(() {
                        _personalData.genere = value!;
                      });
                    }),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Ciudad'),
                  value: _personalData.address,
                  onChanged: (String? newValue) {
                    setState(() {
                      _personalData.address = newValue!;
                    });
                  },
                  items: <String>[
                    'Ciudad 1',
                    'Ciudad 2',
                    'Ciudad 3',
                    'Ciudad 4',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Por favor, selecciona una ciudad';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    print('OnSave DropDown');
                    _personalData.address = value!;
                  },
                ),
                SizedBox(height: 20),
                CheckboxListTile(
                    value: _personalData.termsAndCoditions,
                    title: Text('Acepto terminos y condiciones!'),
                    onChanged: (value) {
                      setState(() {
                        _personalData.termsAndCoditions = value!;
                      });
                    }),
                ElevatedButton(
                    onPressed: () {
                      print('Save form');
                      if (_key.currentState!.validate()) {
                        _key.currentState!.save();

                        if (!_personalData.termsAndCoditions) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  child: Center(
                                      child: Text(
                                          'Debes aceptar los terminos y condiciones')),
                                );
                              });
                          return;
                        }
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text('Save data')));

                        _key.currentState!.reset();
                        _personalData.termsAndCoditions = false;
                        _personalData.genere = 'M';
                        _personalData.address = null;
                        setState(() {});
                      }
                    },
                    child: Text('Guardar'))
              ],
            ),
          )),
    );
  }
}
