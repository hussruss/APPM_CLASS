import 'package:flutter/material.dart';

class Alertas extends StatelessWidget {
  const Alertas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alertas'),
      ),
      body: ListView(children: [
        ElevatedButton(
            onPressed: () {
              _showSnackBar(context);
            },
            style:
                ElevatedButton.styleFrom(backgroundColor: Colors.primaries[0]),
            child: Text('SnackBar')),
        ElevatedButton(
            onPressed: () {
              _showSimpleDialog(context);
            },
            style:
                ElevatedButton.styleFrom(backgroundColor: Colors.primaries[1]),
            child: Text('Simple dialog')),
        ElevatedButton(
            onPressed: () {
              _showAlertDialog(context);
            },
            style:
                ElevatedButton.styleFrom(backgroundColor: Colors.primaries[2]),
            child: Text('Alert dialog')),
        ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Title'),
                      content: Container(
                        width: 100,
                        height: 100,
                        child: Center(
                          child: Text('Simple dialog'),
                        ),
                      ),
                    );
                  });
            },
            style:
                ElevatedButton.styleFrom(backgroundColor: Colors.primaries[2]),
            child: Text('Bottom Sheet')),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2018),
              lastDate: DateTime(2025),
            ).then((DateTime? value) {
              if (value != null) {
                DateTime _fromDate = DateTime.now();
                _fromDate = value;
                final String date = ''; //DateFormat.yMMMd().format(_fromDate);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Selected date: $date')),
                );
              }
            });
          },
          child: const Text('Date Picker Dialog'),
        ),
      ]),
    );
  }

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('SnackBar!!'),
      backgroundColor: Colors.blue,
      duration: Duration(seconds: 5),
    ));
  }

  void _showSimpleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Title'),
          content: Container(
            width: 100,
            height: 100,
            child: Center(
              child: Text('Simple dialog'),
            ),
          ),
        );
      },
    )
        .then((value) => print('Dialog Success'))
        .catchError((value) => print('Dialog Error'));
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Alert Dialog'),
          content: Text('Estas seguro de que deseas cancelar tu pago?'),
          actions: [
            TextButton(
                onPressed: () {
                  return Navigator.pop(context, 'Cancelar');
                },
                child: Text('Cancel')),
            TextButton(
                onPressed: () {
                  return Navigator.pop(context, 'Aceptar');
                },
                child: Text('Aceptar')),
          ],
        );
      },
    ).then((value) {
      print('Respuesta $value');

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('$value')));
    }).catchError((value) => print('Dialog Error'));
  }
}
