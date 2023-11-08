import 'package:bombaysign/homepage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MobileSignInPage extends StatefulWidget {
  @override
  _MobileSignInPageState createState() => _MobileSignInPageState();
}

class _MobileSignInPageState extends State<MobileSignInPage> {
  var redColor = Color(0xFFAA0315);
  final TextEditingController _mobileController = TextEditingController();
  String? firstName, lastName, mobile, email;

  _checkMobile() async {
    String url = 'https://www.bombaysalonspa.com/app2/api/usercheck.php';
    var response =
        await http.post(Uri.parse(url), body: {'mobile': _mobileController.text});
    var decodedData = json.decode(response.body);
    var webresp = decodedData['status'];
    if (webresp == true) {
      firstName = decodedData['data']['firstname'];
      lastName = decodedData['data']['lastname'];
      mobile = decodedData['data']['mobile'];
      email = decodedData['data']['email'];
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (c) => HomePage(
                  firstName: firstName!,
                  lastName: lastName!,
                  mobile: mobile!,
                  email: email!)));
    } else {
      mobile = _mobileController.text;
      Navigator.push(
          context, MaterialPageRoute(builder: (c) => HomePage(mobile: mobile!)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/five.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            height: 400,
            width: 400,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.2),
                blurRadius: 14.0,
                offset: Offset(6.0, 6.0),
              )
            ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('images/bomlogo.png',
                    fit: BoxFit.contain, height: 140, width: 200),
                Text(
                  'Sign In',
                  style: TextStyle(
                      fontFamily: 'Cinzel',
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: redColor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    controller: _mobileController,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0),
                    cursorColor: Colors.black87,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 11.0, 20.0, 11.0),
                      hintText: "Enter Mobile Number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: redColor)),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 335,
                  child: ElevatedButton(


                    child: Padding(
                      padding: EdgeInsets.fromLTRB(14, 10, 14, 10),
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                    onPressed: () {
                      if (_mobileController.text == '') {
                        _showAlert('Alert', 'Plaese enter mobile number.');
                        return;
                      }
                      _checkMobile();
                    },
                  ),
                ),
              ],
            ),
          ),
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
