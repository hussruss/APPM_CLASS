import 'package:flutter/material.dart';
import 'package:m1_s4/pages/welcome_page.dart';

class DetallePage extends StatefulWidget {
  const DetallePage({super.key});
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
        const Background(),
        _buildBack(),
        Padding(
          padding: const EdgeInsets.only(top: 90.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildTitle(),
              const SizedBox(
                height: 20,
              ),
              _buildCard(context),
              const SizedBox(
                height: 20,
              ),
              _buildCardImage(context),
              const SizedBox(
                height: 20,
              ),
              _buildSubTitle(),
              const SizedBox(
                height: 20,
              ),
              ButtonMaterial(
                label: 'Tell your partner',
                width: MediaQuery.of(context).size.width * 0.8,
                height: 60,
                fontSize: 16,
              ),
              const SizedBox(
                height: 20,
              ),
              _buildText(),
            ],
          ),
        )
      ],
    ));
  }

  Padding _buildText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: Text(
        'Not Now',
        style: TextStyle(
            fontFamily: 'Montserrat-Bold',
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 57, 134, 235)),
        textAlign: TextAlign.center,
      ),
    );
  }

  Padding _buildSubTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: Text(
        'Open Testing turned out to be very successful. \n Alexas Safeguarded',
        style: TextStyle(
            fontFamily: 'Montserrat-Bold',
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 57, 134, 235)),
        textAlign: TextAlign.center,
      ),
    );
  }

  Align _buildCardImage(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 350,
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(color: Colors.grey, offset: Offset(0, 1), blurRadius: 4)
            ]),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/images/image_page1.jpeg',
                width: 160,
              ),
              const Divider(
                height: 2,
                thickness: 2,
              ),
              const Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'You paid',
                        style: TextStyle(
                            fontFamily: 'Montserrat-Medium',
                            fontSize: 16,
                            color: Color.fromARGB(255, 161, 174, 199)),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '\$987 USD',
                        style: TextStyle(
                            fontFamily: 'Montserrat-Bold',
                            fontSize: 18,
                            color: Color(0xFF0259cb)),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Service charger',
                        style: TextStyle(
                            fontFamily: 'Montserrat-Medium',
                            fontSize: 16,
                            color: Color.fromARGB(255, 161, 174, 199)),
                      ),
                    ],
                  ),
                  ButtonMaterial(
                    label: 'MORE DETAILS',
                    height: 40,
                    width: 120,
                    fontSize: 12,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _buildCard(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          title: const Text(
            'Alexis Balancesco',
            style: TextStyle(
                color: Color(0xFF0259CB),
                fontFamily: 'Montserrat-Bold',
                fontSize: 12),
          ),
          subtitle: const Text('Your result are here',
              style: TextStyle(fontFamily: 'Montserrat-Medium', fontSize: 12)),
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
              const Positioned(
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
        ));
  }

  Text _buildTitle() {
    return const Text(
      'Congratulation!  \n Your system wors Perfectly',
      style: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
      textAlign: TextAlign.center,
    );
  }

  Positioned _buildBack() {
    return const Positioned(
        top: 60,
        left: 20,
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 30,
        ));
  }
}

class Background extends StatelessWidget {
  const Background({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
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
