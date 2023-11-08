import 'dart:convert';
import 'package:bombaysign/homepage.dart';
import 'package:bombaysign/mobile_signin_page.dart';
import 'package:http/http.dart' as http;
import 'package:bombaysign/termspage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInTab extends StatefulWidget {
  @override
  _SignInTabState createState() => _SignInTabState();
}

class _SignInTabState extends State<SignInTab> {
  static var redColor = Color(0xFFAA0315);
  List<String> _selectedServices = [];
  bool isTermsAgreed = false;
  _getServices() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _selectedServices = prefs.getStringList('services') ?? [];
  }

  _doSignIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String url = 'https://www.bombaysalonspa.com/app2/api/bombaysignin.php';
    print('appointment ${prefs.getString('appointment')} '
        '${prefs.getString('howknow')}, ${prefs.getString('store')} ${prefs.getString('date')} '
        '${prefs.getString('time')}'
        'services ${_selectedServices.join(', ')}');
    var response = await http.post(Uri.parse(url), body: {
      "f_name": prefs.getString('fname'),
      "l_name": prefs.getString('lname'),
      "zip_code": prefs.getString('zipcode'),
      "mobile_number": prefs.getString('mobile'),
      "email": prefs.getString('email'),
      "store": prefs.getString('store'),
      "how_know": prefs.getString('howknow'),
      "stylist": "Sohel",
      "appoiment": prefs.getString('appointment'),
      "date": prefs.getString('date'),
      "time": prefs.getString('time'),
      "services": _selectedServices.join(', ')
    });
    var decodedData = json.decode(response.body);
    var webresp = decodedData['status'];
    if (webresp == 1) {
      _showSuccess('Success', 'You have Signed in Sucessfully');
      prefs.clear();
//      Navigator.pushReplacement(context,
//          MaterialPageRoute(builder: (c) => MobileSignInPage()));
    } else {
      _showAlert('Failure', 'Something went wrong while signing in.');
    }
  }

  @override
  void initState() {
    super.initState();
    _getServices();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/b4.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: _signIn(),
        ),
      ),
    );
  }

  Widget _signIn() {
    return Container(
      height: 650,
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
              'SIGN IN',
              style: TextStyle(
                  color: redColor, fontSize: 24, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12),
            Container(
              height: 300,
              child: GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 1 / 0.4),
                  itemCount: _selectedServices.length,
                  itemBuilder: (c, i) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            border: Border.all(color: redColor, width: 1),
                            borderRadius: BorderRadius.circular(6)),
                        child: Center(
                          child: Text(
                            _selectedServices[i],
                            style: TextStyle(color: redColor, fontSize: 15),
                            textAlign: TextAlign.center,
                            maxLines: 4,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Checkbox(
                  activeColor: redColor,
                  value: isTermsAgreed,
                  onChanged:(value) {
                    _onTermsAgreed(value!);
                  } ,
                ),
                Text(
                  'I agree to the salon',
                  style: TextStyle(color: redColor, fontSize: 24.0),
                ),
                SizedBox(
                  width: 12.0,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Terms & Conditions',
                      style: TextStyle(
                          color: Colors.black87,
                          decoration: TextDecoration.underline,
                          fontSize: 24.0),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (ctx) => TermsPage()));
                        }),
                ),
              ],
            ),
            SizedBox(
              height: 15,
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
                      selectedTab = 2;
                    });
                    pageController!.animateToPage(2,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.decelerate);
                  },
                ),
                Material(
                  color: redColor,
                  borderRadius: BorderRadius.circular(10.0),
                  child: MaterialButton(
                    minWidth: 200,
                    padding: EdgeInsets.fromLTRB(20.0, 11.0, 20.0, 11.0),
                    child: Text("Sign In",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0).copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      if (isTermsAgreed) {
                        _doSignIn();
                      } else {
                        _showAlert('Alert',
                            'Please agree to the terms and conditions to sign in.');
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  goHome() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (c) => MobileSignInPage()));
  }

  _showSuccess(String title, String message) {
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
                goHome();
              },
            ),
          ],
        );
      },
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

  _onTermsAgreed(bool value) {
    setState(() {
      isTermsAgreed = value;
    });
  }
}
