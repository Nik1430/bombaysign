import 'package:bombaysign/homepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailsTab extends StatefulWidget {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? mobile;
  DetailsTab({this.firstName, this.lastName, this.email, this.mobile});

  @override
  _DetailsTabState createState() => _DetailsTabState();
}

class _DetailsTabState extends State<DetailsTab> {
  bool _autoValidate = false;
  static var redColor = Color(0xFFAA0315);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? firstName, lastName, mobile, email, zipCode;
  final _firstController = TextEditingController();
  final _lastController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _zipController = TextEditingController();

  var fieldTheme = ThemeData(
    primaryColor: redColor,
    hintColor: Colors.black87,
  );

  String  validateName(String value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "This field is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return " ";
  }

  String  validateZip(String value) {
    if (value.length == 0) {
      return "This field is Required";
    }
    return " ";
  }

  String  validateMobile(String value) {
    String pattern = r'^(?:[+0]9)?[0-9]{10}$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Mobile Number";
    } else {
      return " ";
    }
  }

  String  validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return " ";
    }
  }

  @override
  void initState() {
    super.initState();
    _firstController.text = widget.firstName!;
    _lastController.text = widget.lastName!;
    _emailController.text = widget.email!;
    _mobileController.text = widget.mobile!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/b1.png'), fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: _detailsForm(),
          )),
    );
  }

  Widget _detailsForm() {
    return Container(
      height: 560,
      width: MediaQuery.of(context).size.width / 1.3,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.2),
          blurRadius: 14.0,
          offset: Offset(6.0, 6.0),
        )
      ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Form(
        /*  autovalidateMode: _autoValidate ,*/
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 10,
              ), // 160
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
                'USER DETAILS',
                style: TextStyle(
                    color: redColor, fontSize: 24, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    child: Theme(
                      data: fieldTheme,
                      child: TextFormField(
                        controller: _firstController,
                        validator: (value){
                          validateName(value!);
                        },
                        onSaved: (  val) {
                          firstName = val;
                        },
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0, color: Colors.black87),
                        cursorColor: Colors.black87,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 11.0, 20.0, 11.0),
                          hintText: "First Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Flexible(
                    child: Theme(
                      data: fieldTheme,
                      child: TextFormField(
                        controller: _lastController,
                        validator: (value){
                          validateName(value!);
                        },
                        onSaved: (  val) {
                          lastName = val;
                        },
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0),
                        cursorColor: Colors.black87,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 11.0, 20.0, 11.0),
                          hintText: "Last Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.black)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 22.0,
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    child: Theme(
                      data: fieldTheme,
                      child: TextFormField(
                        controller: _mobileController,
                        validator: (value){
                          validateMobile(value!);
                        },
                        onSaved: (  val) {
                          mobile = val;
                        },
                        keyboardType: TextInputType.phone,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0),
                        cursorColor: Colors.black87,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 11.0, 20.0, 11.0),
                          hintText: "Mobile Number",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.black)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Flexible(
                    child: Theme(
                      data: fieldTheme,
                      child: TextFormField(
                        controller: _zipController,
                        validator: (value){
                          validateZip(value!);
                        },
                        onSaved: (  val) {
                          zipCode = val;
                        },
                        keyboardType: TextInputType.phone,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0),
                        cursorColor: Colors.black87,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 11.0, 20.0, 11.0),
                          hintText: "Zip Code",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.black)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Theme(
                data: fieldTheme,
                child: TextFormField(
                  controller: _emailController,
                  validator: (value){
                    validateZip(value!);
                  },
                  onSaved: ( val) {
                    email = val;
                  },
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0),
                  cursorColor: Colors.black87,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 11.0, 20.0, 11.0),
                    hintText: "Email Address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
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
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    print(
                        '${_firstController.text}, ${_lastController.text}, ${_zipController.text},'
                        ' ${_mobileController.text}, ${_emailController.text}');
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString('fname', _firstController.text);
                    prefs.setString('lname', _lastController.text);
                    prefs.setString('zipcode', _zipController.text);
                    prefs.setString('mobile', _mobileController.text);
                    prefs.setString('email', _emailController.text);
                    setState(() {
                      selectedTab = 1;
                    });
                    pageController!.animateToPage(1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.decelerate);
                  } else {
                    setState(() {
                      _autoValidate = true;
                    });
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
