import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:m1_s4/pages/detalle_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  final UserData _userData =
      UserData(email: '', password: '', aceptTermsAndConditons: false);

  void _login() {
    //Validar
    if (_key.currentState!.validate()) {
      _key.currentState!.save();
      if (!_userData.aceptTermsAndConditons) {
        showDialog(
            context: context,
            builder: (context) {
              return const Dialog(
                child: Center(
                    child: Text('Debes aceptar los terminos y condiciones')),
              );
            });
        return;
      }
      if (!loginService(_userData)) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Tu usuario o contraseña no son correctos')));
        return;
      }

      //Login
      Navigator.of(context).pushNamed('/youtubeApp');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          SafeArea(
              child: Form(
            key: _key,
            child: Column(children: [
              _buildIcon(),
              _buildForm(),
            ]),
          )),
        ],
      ),
    );
  }

  Expanded _buildForm() {
    return Expanded(
      flex: 5,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildTitle(),
            const SizedBox(
              height: 40,
            ),
            _buildEmailTextFormField(),
            const SizedBox(
              height: 40,
            ),
            _buildPassTextFormField(),
            const SizedBox(height: 20),
            _buildAceptTerms(),
            const SizedBox(
              height: 80,
            ),
            _buildButton()
          ],
        ),
      ),
    );
  }

  ElevatedButton _buildButton() {
    return ElevatedButton(
        onPressed: () {
          _login();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
        ),
        child: const Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'LogIn',
            style: TextStyle(
                color: Color.fromARGB(255, 6, 132, 216), fontSize: 30),
          ),
        ));
  }

  Padding _buildAceptTerms() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: CheckboxListTile(
          value: _userData.aceptTermsAndConditons,
          title: const Text(
            'Acepto terminos y condiciones!',
            style: TextStyle(color: Colors.white),
          ),
          onChanged: (value) {
            setState(() {
              _userData.aceptTermsAndConditons = value!;
            });
          }),
    );
  }

  ConstrainedBox _buildPassTextFormField() {
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8, minWidth: 200),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(8),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          labelText: 'Password',
          prefixIcon: const Icon(
            Icons.lock,
            color: Colors.blue,
          ),
        ),
        onSaved: (value) {
          setState(() {
            _userData.password = value!;
          });
        },
        validator: (value) {
          if (value!.isEmpty || value!.length < 6) {
            return 'La contraseña debe contener más de 6 caracteres.';
          }
        },
      ),
    );
  }

  ConstrainedBox _buildEmailTextFormField() {
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8, minWidth: 200),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          labelText: 'Email',
          prefixIcon: const Icon(
            Icons.mail,
            color: Colors.blue,
          ),
        ),
        onSaved: (value) {
          setState(() {
            _userData.email = value!;
          });
        },
        validator: (value) {
          return validateEmail(value);
        },
      ),
    );
  }

  Text _buildTitle() {
    return const Text(
      'LogIn',
      style: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
      textAlign: TextAlign.center,
    );
  }

  Expanded _buildIcon() {
    return const Expanded(
      flex: 2,
      child: Center(
        child: Icon(
          Icons.login,
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }

  Container _buildBackGround() {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 158, 13, 184),
        Color.fromARGB(244, 63, 0, 146)
      ], begin: Alignment.bottomLeft)),
    );
  }
}

class UserData {
  String email;
  String password;
  bool aceptTermsAndConditons;
  UserData(
      {required this.email,
      required this.password,
      required this.aceptTermsAndConditons});
}

String? validateEmail(String? value) {
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);

  return value!.isNotEmpty && !regex.hasMatch(value)
      ? 'Ingresa un correo valido'
      : null;
}

bool loginService(UserData user) {
  return user.email == 'hola@hola.com' && user.password == '123456';
}
