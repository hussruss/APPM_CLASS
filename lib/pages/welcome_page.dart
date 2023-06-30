import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final pageView = PageView(
      controller: _controller,
      scrollDirection: Axis.horizontal,
      children: listPage,
    );
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildIcon(),
          SizedBox(
            height: 20,
            width: MediaQuery.of(context).size.width,
          ),
          _buildTitle(context),
          _buildSubtitle(context),
          const SizedBox(
            height: 20,
          ),
          _buildPageView(pageView),
          const SizedBox(
            height: 20,
          ),
          _buildIdicators(),
          const SizedBox(
            height: 20,
          ),
          ButtonMaterial(
            label: 'Get Started',
            width: MediaQuery.of(context).size.width * 0.8,
            height: 60,
            fontSize: 16,
          ),
          const SizedBox(
            height: 20,
          ),
          _buildText(),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  RichText _buildText() {
    return RichText(
      text: const TextSpan(
        text: 'Al ready have an accoutn? /',
        style: TextStyle(
            fontFamily: 'Montserrat-Bold',
            fontSize: 15,
            fontWeight: FontWeight.normal,
            color: Color.fromARGB(255, 95, 155, 233)),
        children: <TextSpan>[
          TextSpan(
              text: 'Sign In', style: TextStyle(fontWeight: FontWeight.w900)),
        ],
      ),
    );
  }

  SmoothPageIndicator _buildIdicators() {
    return SmoothPageIndicator(
      controller: _controller,
      count: listPage.length,
      effect: const ExpandingDotsEffect(),
    );
  }

  SizedBox _buildPageView(PageView _pageView) {
    return SizedBox(
      height: 300,
      child: _pageView,
    );
  }

  Padding _buildIcon() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Image.asset('assets/images/icon_robot.jpeg'),
    );
  }

  Padding _buildSubtitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: const Text(
            'A IA Remote controller |UI kit made with love  for Adobe XD',
            style: TextStyle(
                fontFamily: 'Montserrat-Bold',
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 57, 134, 235)),
            textAlign: TextAlign.center,
          )),
    );
  }

  SizedBox _buildTitle(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: const Text(
        'Intellogent creative partner, Welcome!',
        style: TextStyle(
            fontFamily: 'Montserrat-Bold',
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0259cb)),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class ButtonMaterial extends StatelessWidget {
  final String label;
  final double width;
  final double height;
  final double fontSize;
  const ButtonMaterial({
    required this.label,
    required this.width,
    required this.height,
    required this.fontSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              Color(0xff468AFF),
              Color(0xff0057C9),
            ], begin: Alignment.bottomLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Montserrat-Bold',
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> listPage = [
  Image.asset(
    'assets/images/image_page2.jpeg',
    height: 300,
  ),
  Image.asset(
    'assets/images/image_page2.jpeg',
    height: 300,
  ),
  Image.asset(
    'assets/images/image_page2.jpeg',
    height: 300,
  ),
  Image.asset(
    'assets/images/image_page2.jpeg',
    height: 300,
  ),
];
