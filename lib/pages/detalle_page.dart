import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetallePage extends StatefulWidget {
  DetallePage({super.key});
  @override
  State<DetallePage> createState() => _DetallePageState();
}

class _DetallePageState extends State<DetallePage> {
  final PageController controller = PageController(
    initialPage: 1,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Backgroud(),
        _buildBack(),
        Padding(
          padding: const EdgeInsets.only(top: 90.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Congratulation!  \n Your system wors Perfectly',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    title: Text(
                      'Alexis Balancesco',
                      style: TextStyle(
                          color: Color(0xFF0259CB),
                          fontFamily: 'Montserrat-Bold',
                          fontSize: 12),
                    ),
                    subtitle: Text('Your result are here',
                        style: TextStyle(
                            fontFamily: 'Montserrat-Medium', fontSize: 12)),
                    trailing: Stack(
                      children: [
                        CircleAvatar(
                          child: Center(
                            child: Image.asset(
                              'assets/images/icon_robot.jpeg',
                              width: 20,
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              minRadius: 8,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                minRadius: 6,
                              ),
                            ))
                      ],
                    ),
                  ))
            ],
          ),
        )
      ],
    ));
  }

  Positioned _buildBack() {
    return Positioned(
        top: 60,
        left: 20,
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 30,
        ));
  }
}

class Backgroud extends StatelessWidget {
  const Backgroud({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xff468AFF),
            Color(0xff0057C9),
          ], begin: Alignment.bottomLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
    );
  }
}
