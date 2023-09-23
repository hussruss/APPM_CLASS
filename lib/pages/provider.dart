import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderTheme extends ChangeNotifier {
  ThemeData currentTheme = ThemeData.dark();

  void toggleTheme() {
    currentTheme = currentTheme == ThemeData.light()
        ? ThemeData.dark()
        : ThemeData.light();
    notifyListeners();
  }
}

class ProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ProviderTheme()),
    ], child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: context.watch<ProviderTheme>().currentTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Theme app'),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Presiona el botón para cambiar el tema:'),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<ProviderTheme>().toggleTheme();
                },
                child: Text('Cambiar Tema'))
          ]),
        ),
      ),
    );
  }
}
