import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  String email;
  String pass;
  User({required this.email, required this.pass});
}

class LoginWithSharedPreferences extends StatefulWidget {
  const LoginWithSharedPreferences({super.key});

  @override
  State<LoginWithSharedPreferences> createState() =>
      _LoginWithSharedPreferencesState();
}

class _LoginWithSharedPreferencesState
    extends State<LoginWithSharedPreferences> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<User> _users = [];

  User _user = User(email: '', pass: '');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_setUsers();
    _getUsers();
  }

  void _getUsers() async {
    SharedPreferences sharedP = await SharedPreferences.getInstance();
    List<String> emails = await sharedP.getStringList('emails') ?? [];
    List<String> pass = await sharedP.getStringList('pass') ?? [];
    emails.asMap().forEach((key, value) {
      _users.add(User(email: value, pass: pass[key]));
    });
    setState(() {});
  }

  void _setUsers() async {
    SharedPreferences sharedP = await SharedPreferences.getInstance();
    sharedP.setStringList(
        'emails', ['email1@test.com', 'email2@test.com', 'email3@test.com']);
    sharedP.setStringList('pass', ['pass1', 'pass2', 'pass3']);
  }

  void _login() {
    _formKey.currentState!.save();

    final userFound = _users.firstWhere(
        (element) => element.email == _user.email,
        orElse: () => User(email: '', pass: ''));
    if (userFound.email.isNotEmpty &&
        (userFound.email == _user.email && userFound.pass == _user.pass)) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Welcome(
              user: userFound.email,
            ),
          ));
    } else {
      _showSnackBar(context);
    }
  }

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Error'),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 5),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.1),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: 'Email',
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.blue,
                      ),
                    ),
                    onSaved: (value) {
                      setState(() {
                        _user.email = value ?? '';
                      });
                    },
                    validator: (value) {
                      return validateEmail(value);
                    },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.1),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: 'Password',
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.blue,
                      ),
                    ),
                    onSaved: (value) {
                      setState(() {
                        _user.pass = value ?? '';
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty || value!.length < 6) {
                        return 'La contraseña debe contener más de 6 caracteres.';
                      }
                    },
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      _login();
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        )),
                        minimumSize: MaterialStateProperty.all(
                            Size(MediaQuery.of(context).size.width * 0.8, 50))),
                    child: const Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'LogIn',
                        style: TextStyle(
                            color: Color.fromARGB(255, 6, 132, 216),
                            fontSize: 25),
                      ),
                    ))
              ],
            )));
  }
}

class Welcome extends StatelessWidget {
  String user;

  Welcome({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Bienvenido $user'),
      ),
    );
  }
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
