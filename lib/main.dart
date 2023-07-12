import 'package:flutter/material.dart';
import 'package:m1_s4/navigator/navigatorObserver.dart';
import 'package:m1_s4/utils/const.dart';
import 'navigator/routes.dart';

//'https://source.unsplash.com/random/250×250/?programming&${index}'

void main() => runApp(MyApps());

class MyApps extends StatelessWidget {
  const MyApps({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey =
        GlobalKey<ScaffoldMessengerState>();

    return MaterialApp(
        title: 'Material App',
        scaffoldMessengerKey: scaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: (settings) {
          print('<<<<<onGenerateRoute $settings');
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute<void>(
            settings: settings,
            builder: (BuildContext context) =>
                Scaffold(body: Center(child: Text('Not Found'))),
          );
        },
        navigatorObservers: [NavigatorHistory()],
        routes: generateRoutes(context)
        // theme: ThemeData.dark().copyWith(
        //     appBarTheme: AppBarTheme(color: Colors.red),
        //     floatingActionButtonTheme:
        //         FloatingActionButtonThemeData(backgroundColor: Colors.red)),
        );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: GridView.builder(
        itemCount: Const.itemList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 4, crossAxisSpacing: 4),
        itemBuilder: (BuildContext context, int index) {
          return _buildItemButon(index, context);
        },
      ),
    );
  }

  GestureDetector _buildItemButon(int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Const.itemList[index].route);
      },
      child: Card(
        elevation: 4,
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.primaries[index % Colors.primaries.length].shade700,
                Colors.primaries[index % Colors.primaries.length].shade500,
                Colors.primaries[Colors.primaries.length == index
                    ? index % Colors.primaries.length
                    : index % Colors.primaries.length],
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(children: [
            Expanded(
                child: Icon(
              Const.itemList[index].icon,
              color: Colors.white,
              size: 50,
            )),
            Text(
              Const.itemList[index].title,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )
          ]),
        ),
      ),
    );
  }
}

class ButtonIconItem {
  final String title;
  final IconData icon;
  final String route;

  ButtonIconItem(this.title, this.icon, this.route);
}
