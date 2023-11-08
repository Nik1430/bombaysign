import 'package:bombaysign/homepage.dart';
import 'package:bombaysign/services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServicesTab extends StatefulWidget {
  @override
  _ServicesTabState createState() => _ServicesTabState();
}

class _ServicesTabState extends State<ServicesTab> {
  static var redColor = Color(0xFFAA0315);
  List<String> _services = [
    'Threading',
    'Waxing',
    'Facial',
    'Hair',
    'Henna',
    'Others'
  ];
  List<String> _serviceIcons = [
    'threading_icon.png',
    'waxing_icon.png',
    'facial_icon.png',
    'hair_icon.png',
    'henna_icon.png',
    'others_icon.png'
  ];
  List _images = [
    'images/threading.jpg',
    'images/waxing.jpg',
    'images/facial.jpg',
    'images/hair.jpg',
    'images/hennatatoo.jpg',
    'images/otherservice.jpg'
  ];
  List<List<String>> _subservices = [
    [
      "Eyebrow Threading",
      "Upper Lip",
      "Lower Lip",
      "Chin",
      "Sides",
      "Full Face",
      "Forehead",
      "Neck"
    ],
    [
      "Arms",
      "Half Arms",
      "Under Arms",
      "Legs",
      "Half Legs",
      "Bikini",
      "Brazilian",
      "Butt",
      "Stomach",
      "Chest",
      "Back",
      "Half Back",
      "Men's back"
    ],
    ["European", "Dermalogica Facial", "Express"],
    [
      "Men's hair cut",
      "Men's hair cut with shampooing",
      "Women's haircut with shampoo & blow dry",
      "Color (men)",
      "Color (women)",
      "Highlight cap",
      "Highlight foil",
      "Relaxer",
      "Straightening",
      "Perm"
    ],
    ["Henna Tattoo"],
    ["Eye Lashes", "Eyebrow Tinting", "Detox Foot Spa"]
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/b3.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: _selectServices(),
        ),
      ),
    );
  }

  Widget _selectServices() {
    return Container(
      height: 735, // 620
      width: MediaQuery.of(context).size.width / 1.3,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.2),
          blurRadius: 14.0,
          offset: Offset(6.0, 6.0),
        )
      ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Image.asset(
              'images/bomlogo.png',
              fit: BoxFit.cover,
              width: 230,
              height: 135,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'SELECT SERVICES',
              style: TextStyle(
                  color: redColor, fontSize: 24, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: Container(
                child: MediaQuery.of(context).orientation ==
                        Orientation.portrait
                    ? GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, childAspectRatio: 1 / 1.25),
                        itemCount: _services.length,
                        itemBuilder: (c, i) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 12.0),
                            child: GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(.2),
                                        blurRadius: 14.0,
                                        offset: Offset(6.0, 6.0),
                                      )
                                    ]),
                                child: Column(
                                  children: <Widget>[
                                    Flexible(
                                      flex: 8,
                                      child: Hero(
                                          tag: _services[i],
                                          child: Image.asset(_images[i],
                                              fit: BoxFit.cover,
                                              width: double.infinity)),
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    Text(
                                      _services[i],
                                      style: TextStyle(fontSize: 24.0),
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext ctx) => Services(
                                        serviceName: _services[i],
                                        serviceImage: _images[i],
                                        subServices: _subservices[i],
                                      ),
                                    ));
                              },
                            ),
                          );
                        })
                    : GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, childAspectRatio: 1 / 0.9),
                        itemCount: _services.length,
                        itemBuilder: (c, i) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 15.0),
                            child: GestureDetector(
                              child: Container(
                                width: 200,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(.2),
                                        blurRadius: 14.0,
                                        offset: Offset(6.0, 6.0),
                                      )
                                    ]),
                                child: Column(
                                  children: <Widget>[
                                    Flexible(
                                      flex: 7,
                                      child: Hero(
                                          tag: _services[i],
                                          child: Image.asset(
                                            _images[i],
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                          )),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      _services[i],
                                      style: TextStyle(fontSize: 24.0),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                    ),
                                    SizedBox(height: 8.0),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext ctx) => Services(
                                        serviceName: _services[i],
                                        serviceImage: _images[i],
                                        subServices: _subservices[i],
                                      ),
                                    ));
                              },
                            ),
                          );
                        }),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                OutlinedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 110,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(
                            Icons.arrow_back_ios,
                            color: redColor,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'PREV',
                            style: TextStyle(color: redColor, fontSize: 22),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedTab = 1;
                    });
                    pageController!.animateToPage(1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.decelerate);
                  },
                ),
                OutlinedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 110,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            'NEXT',
                            style: TextStyle(color: redColor, fontSize: 22),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: redColor,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    List<String> selectedServices =
                        prefs.getStringList('services') ?? [];
                    if (selectedServices.isEmpty) {
                      _showAlert(
                          'Alert', 'Please select services to continue.');
                      return;
                    }
                    setState(() {
                      selectedTab = 3;
                    });
                    pageController?.animateToPage(3,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.decelerate);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  _showAlert(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(title),
          content: new Text(message),
          actions: <Widget>[
            new TextButton(
              child: new Text(
                "Okay",
                style: TextStyle(color: redColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
