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
    final pageView = PageView(
      controller: controller,
      scrollDirection: Axis.horizontal,
      children: [
        Image.asset(
          'assets/images/image_page2.jpeg',
          height: 300,
        ),
        Image.asset(
          'assets/images/image_page1.jpeg',
          height: 300,
        ),
        Image.asset(
          'assets/images/image_page1.jpeg',
          height: 300,
        ),
        Image.asset(
          'assets/images/image_page1.jpeg',
          height: 300,
        ),
      ],
    );
    return Scaffold(
      body: SafeArea(
          child: Container(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Image.asset('assets/images/icon_robot.jpeg'),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: const Text(
              'Intelligent creative partner, Welcome!',
              style: TextStyle(
                  fontFamily: 'Montserrat-Bold',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0259cb)),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                'A Al Remote controller UI Kit made with love for Adobe XD',
                style: TextStyle(
                    fontFamily: 'Montserrat-Bold',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0259cb).withOpacity(0.4)),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 300,
            child: pageView,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            child: SmoothPageIndicator(controller: controller, count: 4),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 50, right: 50, top: 20),
            child: InkWell(
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF468AFF), Color(0xFF0057C9)],
                      begin: Alignment.topCenter,
                      end: Alignment.topCenter,
                    ),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Text(
                    'GET STARTED',
                    style: TextStyle(
                        fontFamily: 'Montserrat-Bold',
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text.rich(TextSpan(
              text: 'Already have an acount? ',
              style: TextStyle(
                  fontFamily: 'Montserrat-Bold',
                  fontSize: 13,
                  color: Color(0x5e0259cd)),
              children: [
                TextSpan(
                    text: 'Sign In',
                    style: TextStyle(
                        fontFamily: 'Montserrat-Bold',
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0x5e0259cd)))
              ]))
        ]),
      )),
    );
  }
}
