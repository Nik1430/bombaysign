import 'package:bombaysign/termspage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PiercingConsent extends StatefulWidget {
  @override
  _PiercingConsentState createState() => _PiercingConsentState();
}

class _PiercingConsentState extends State<PiercingConsent> {
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
                'PIERCING CONSENT RELEASE FORM',
                style: TextStyle(
                    color: redColor, fontSize: 24, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'PLEASE READ AND CHECK THE BOXES WHEN YOU ARE CERTAIN YOU UNDERSTAND \n\n THE IMPLICATIONS OF SIGNING THIS DOCUMENT',
                style: TextStyle(
                    color: redColor, fontSize: 22, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              Text(
                "In consideration of receiving piercing from Bombay Salon And Spa. \n\nI confirm the following:",
                style: TextStyle(
                  fontSize: 18.0,
                ),
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
                          height: 10,
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
                        SizedBox(height: 20.0),
                        Wrap(
                          children: [
                            Text(
                              "I, ",
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Theme(
                              data: fieldTheme,
                              child: TextFormField(
                                validator:   (val){
                                  validateZip(val!);
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
                                  hintText: "Enter your name",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                ),
                              ),
                            ),
                            Text(
                              "have been fully informed of the risks of body piercing including but not limited to infection and other medical complications, allergic reactions to metaljewelry, latex gloves, and antibiotics. Having been informed of the potential risks associated with receiving a body piercing, and I still wish to proceed with the procedure. I assume any and all risks that may arise from the body piercing.",
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(height: 10.0),
                                  Flexible(
                                    child: Theme(
                                      data: fieldTheme,
                                      child: TextFormField(
                                        validator:   (val){
                                          validateZip(val!);
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
                                          hintText: "Signature",
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
                  Column(
                    children: [
                      Text(
                        'I agree to the salon',
                        style: TextStyle(color: redColor, fontSize: 14.0),
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'Terms & Conditions',
                            style: TextStyle(
                                color: Colors.black87,
                                decoration: TextDecoration.underline,
                                fontSize: 14.0),
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
                    width: 12.0,
                  ),

                ],
              ),
              SizedBox(
                height: 15,
              ),
             Column(
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
    'All questions about the body piercing procedure have been answered to my satisfaction, andI have been given aftercare instructions for the piercing. I am about to receive.':
        false,
    'I have been informed about what I can expect following the body piercing listed on the informed body piercing consent form, including medical complications that may occur following this body piercing.':
        false,
    'I understand that body piercing can result in nerve damage, and that if I choose to remove my jewelry, holes or scars may be left.':
        false,
    'I am the person on the legal ID presented as proof that I am at least 18 years of age, or the body piercing will be performed in the presence of my parent or legal guardian.':
        false,
    'I am not under the influence of alcohol or drugs and I am voluntarily submitting to the piercing':
        false,
    'I understand there is a possibility of an allergic reaction to the jewelry inserted into the fresh body piercing.':
        false,
    'I understand there is a possibility of getting an infection, and I have been advised of the signs and symptoms of infection that indicate a need to seek medical attention.':
        false,
    'I agree to follow all instructions concerning the care of my body piercing.':
        false,
    'I understand that there is a chance I might feel lightheaded or dizzy during or after being pierced':
        false,
    'I agree to immediately notify the body piercer in the event I feel lightheaded, dizzy and/or faint before, during or after the procedure.':
        false,
  };
  Map<String, bool> values1 = {
    'Hair Loss': false,
    'Anemia': false,
    'Sensitivity to cosmetics': false,
    'Prolonged bleeding': false,
    'Diabetes': false,
    'Trichotillomania': false,
    'Epilepsy': false,
    'Artificial Heart Valve': false,
    'Low Blood pressure': false,
    'High Blood pressure': false,
    'Hemophilia': false,
    'HIV': false,
    'Fainting spells or dizziness': false,
    'Circulatory Problems': false,
    'Hypertrophic or keloid scars': false,
    'Liver Disease': false,
    'Alopecia': false,
    'Tumors, growths, cysts': false,
    'Thyroid disturbances Cancer': false,
    'Botox/filler injections': false,
    'Hepatitis': false,
    'Healing Problems': false,
    'Do you scar easily?': false,
    'Do you bruise/bleed easily?': false,
  };
}
