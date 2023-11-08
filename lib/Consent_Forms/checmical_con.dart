import 'package:bombaysign/termspage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChemicalConsent extends StatefulWidget {
  @override
  _ChemicalConsentState createState() => _ChemicalConsentState();
}

class _ChemicalConsentState extends State<ChemicalConsent> {
  static var redColor = Color(0xFFAA0315);
  bool isTermsAgreed = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _firstController = TextEditingController();
  final _lastController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _zipController = TextEditingController();
  final _dateController = TextEditingController();

  var fieldTheme = ThemeData(
    primaryColor: redColor,
    hintColor: Colors.black87,
  );

  String validateName(String value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "This field is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return "";
  }

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String? formatted, tms;
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        var now = new DateTime.now();
        var formatter = new DateFormat('yyyy-MM-dd');
        formatted = formatter.format(picked);
        print('formated date: $formatted');
        _dateController.text = formatted!;
        print(picked);
      });
  }

  String validateZip(String value) {
    if (value.length == 0) {
      return "This field is Required";
    }
    return "";
  }

  String validateMobile(String value) {
    String pattern = r'^(?:[+0]9)?[0-9]{10}$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Mobile Number";
    } else {
      return "";
    }
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return "";
    }
  }

  @override
  void initState() {
    super.initState();
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
          child: _form(context),
        ),
      ),
    );
  }

  _form(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.3,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.2),
          blurRadius: 14.0,
          offset: Offset(6.0, 6.0),
        )
      ]),
      child: SingleChildScrollView(
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
                'Chemical Service Waiver Form',
                style: TextStyle(
                    color: redColor, fontSize: 24, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Dear Valued BOMBAY SALON & SPA GUEST",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 20),
                        Text(
                          "You have chosen to receive a chemical service with us. We pride ourselves on our high level of skill and our long lasting relationships with our guests. Here are some tips that can make your service results more successful:",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        ListView(
                          shrinkWrap: true,
                          primary: false,
                          children: values.keys.map((String key) {
                            return CheckboxListTile(
                              title: Text(key),
                              value: values[key],
                              activeColor: redColor,
                              checkColor: Colors.white,
                              onChanged: (  value) {
                                setState(() {
                                  values[key] = value!;
                                });
                              },
                            );
                          }).toList(),
                        ),
                        _buildAgreement(),
                        SizedBox(height: 30.0),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          " I have made my stylist aware of all the process I have used on my hair in the recent months to assist in their aassessment of hair's current status and the process that I need to achieve my desired results. I relaize that this is very important information and that any information I withhold regarding my previous processes will increase my chances of damage and the potential for unpredictable chemical reactions. Chemcial processes may cause some damange to the integrity of my hair. There are products recommended to improve the health of my hair as well as maintain the results after the service. I am aware that my technician has been trained in the service technique and that they will do their absolute best to create the best results and therefore as an ongoing basis, I will not hold liable BOMBAY SALON & SPA, or my techician of the process has unecpected or undesired results",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          "Thank you we look forward to working with you.",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: Theme(
                                      data: fieldTheme,
                                      child: TextFormField(
                                        validator: (value){
                                          validateZip(value!);
                                        },
                                        onSaved: (  val) {
                                          //zipCode = val;
                                        },
                                        keyboardType: TextInputType.phone,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20.0),
                                        cursorColor: Colors.black87,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.fromLTRB(
                                              20.0, 11.0, 20.0, 11.0),
                                          hintText: "Customer Signature",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Flexible(
                                    child: Theme(
                                      data: fieldTheme,
                                      child: TextField(
                                        controller: _dateController,
                                        onTap: () => _selectDate(context),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20.0),
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.fromLTRB(
                                              10.0, 11.0, 10.0, 11.0),
                                          hintText: "Select Date",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Flexible(
                                    child: Theme(
                                      data: fieldTheme,
                                      child: TextFormField(
                                        validator: (value){
                                          validateZip(value!);
                                        },
                                        onSaved: (  val) {
                                          //zipCode = val;
                                        },
                                        keyboardType: TextInputType.phone,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20.0),
                                        cursorColor: Colors.black87,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.fromLTRB(
                                              20.0, 11.0, 20.0, 11.0),
                                          hintText: "Customer Printed Name",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: Theme(
                                      data: fieldTheme,
                                      child: TextFormField(
                                        validator:(value){
                                          validateZip(value!);
                                        },
                                        onSaved: (  val) {
                                          //zipCode = val;
                                        },
                                        keyboardType: TextInputType.phone,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20.0),
                                        cursorColor: Colors.black87,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.fromLTRB(
                                              20.0, 11.0, 20.0, 11.0),
                                          hintText: "Technican Signature",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Flexible(
                                    child: Theme(
                                      data: fieldTheme,
                                      child: TextField(
                                        controller: _dateController,
                                        onTap: () => _selectDate(context),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20.0),
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.fromLTRB(
                                              10.0, 11.0, 10.0, 11.0),
                                          hintText: "Select Date",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Flexible(
                                    child: Theme(
                                      data: fieldTheme,
                                      child: TextFormField(
                                        validator: (value){
                                          validateZip(value!);
                                        },
                                        onSaved: ( val) {
                                          //zipCode = val;
                                        },
                                        keyboardType: TextInputType.phone,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20.0),
                                        cursorColor: Colors.black87,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.fromLTRB(
                                              20.0, 11.0, 20.0, 11.0),
                                          hintText: "Technician Comments",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                    activeColor: redColor,
                    value: isTermsAgreed,
                    onChanged: (value) {
                      isTermsAgreed = value!;
                      setState(() {});
                    },
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => TermsPage()));
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
                      // setState(() {
                      //   selectedTab = 2;
                      // });
                      // _pageController.animateToPage(2,
                      //     duration: Duration(milliseconds: 500),
                      //     curve: Curves.decelerate);
                    },
                  ),
                  Material(
                    color: redColor,
                    borderRadius: BorderRadius.circular(10.0),
                    child: MaterialButton(
                      minWidth: 200,
                      padding: EdgeInsets.fromLTRB(20.0, 11.0, 20.0, 11.0),
                      child: Text("Submit",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20.0).copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  Map<String, bool> values = {
    'Chemical services can have varying results based on your individual hair.':
        false,
    'It is extermely important that you make your stylist aware of any and all other processes you have used on your hair.':
        false,
    'There is a risk of your jewelry (earrings and necklaces) being damaged or lost during your service. We recommend you remove them before your service.':
        false,
    'Please feel comfortable contacting Bombay Salon & Spa at any time after your service if you have any questions or concerns.':
        false,
  };
  Map<String, bool> values1 = {
    'No waterproof mascara': false,
    'No oil based products around the eye area': false,
    'No water can come in contact with the eye area for 24 hours after the application':
        false,
    'No tinting or perming of eyelash extensions': false,
    'No pulling or rubbing of the eyelash extensions': false,
    'Should any kind of eye drops be necessary extra care should be taken to prevent moisture from coming into contact with the eyelash extensions':
        false,
  };
  var tmpArray = [];

  getCheckboxItems() {
    values.forEach((key, value) {
      if (value == true) {
        tmpArray.add(key);
      }
    });
    print(tmpArray);
    tmpArray.clear();
  }

  _checkList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: values.keys.map((String key) {
              return CheckboxListTile(
                title: Text(key),
                value: values[key],
                activeColor: Colors.pink,
                checkColor: Colors.white,
                onChanged: (  value) {
                  setState(() {
                    values[key] = value!;
                  });
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  List<String> _agreement = [
    " including its artists, associates, apprentices, agents, or any employees (hereinafter referred to as the “Tattoo Studio” I agree to the following:",
    " understand that in rare occasions there are risks \nassociated with having artificial eyelashes \nand eyelash extensions applied to or removed from my \nnatural eyelashes. I further understand that in \nrare cases as part of the procedure eye irritation and discomfort could occur. \nI agree that if I experience any of these conditions \nwith my lashes that I will contact \nthe certified eyelash extension professional that performed \nthis procedure and it may be beneficial to have the eyelashes removed.",
    " understand and agree to the after-care instructions \nprovided by the certified eyelash extension \nprofessional for the use and care of my eyelash extensions.\nI realize and accept the consequences of \nfailure to adhere to these instructions may cause the eyelash \nextensions to fall out and/or decrease the time the lashes will last.",
    " understand and consent to having my eyes closed and \ncovered for the duration of approximately 60-120 minute procedure. \nTimes may vary depending on the type and number \nof eyelashes applied.",
    " I am informing the certified eyelash extension professional of the following conditions by marking with a check:"
  ];

  _buildAgreement() {
    return ListView(
      shrinkWrap: true,
      primary: false,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(10.0),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "I have been made aware by",
            ),
            SizedBox(width: 10.0),
            Container(
              width: 100.0,
              child: Theme(
                data: fieldTheme,
                child: TextFormField(
                  controller: _emailController,
                  validator: (value){
                    validateZip(value!);
                  },
                  onSaved: (  val) {
                    //zipCode = val;
                  },
                  keyboardType: TextInputType.phone,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0),
                  cursorColor: Colors.black87,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 11.0, 20.0, 11.0),
                    hintText: "Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            SizedBox(
              width: 10.0,
            ),
            Flexible(
              child: Text(
                " a tehnician of Bombay Salon & Spa that I am choosing to receive a service.",
                style: TextStyle(
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ],
    );
  }
}
