import 'package:bombaysign/termspage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MicroDisclosure extends StatefulWidget {
  @override
  _MicroDisclosureState createState() => _MicroDisclosureState();
}

class _MicroDisclosureState extends State<MicroDisclosure> {
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
    return  "";
  }

  String validateMobile(String value) {
    String pattern = r'^(?:[+0]9)?[0-9]{10}$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Mobile Number";
    } else {
      return  "";
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
      return  "";
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
                'MICROBLADING DISCLOSURE & RELEASE FORM',
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
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "I understand the following completely: (initial each statement)",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
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
                        SizedBox(height: 30.0),
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
                                          hintText: "Printed Name",
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
                                  SizedBox(height: 10),
                                  Flexible(
                                    child: Theme(
                                      data: fieldTheme,
                                      child: TextFormField(
                                        validator:   (val){
                                          validateZip(val!);
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
    'Microblading can last 6-18 months depending on how my skin reacts to the procedure. There may be fading and/or discoloration. The result may not be what I expected to receive. I understand this is a semi-permanent makeup procedure that may take numerous follow-ups and touch ups to get desired result.':
        false,
    'One complimentary touch up is included in the price of today’s procedure. I must schedule the touch up for 6 to 8 weeks after my initial treatment. I have read and understand the Fees & Policies sheet.':
        false,
    'There is no warranty or guarantee made to me as a result of this procedure and the final result cannot be guaranteed. There are no refunds for this procedure, as results will vary, and individual results are not guaranteed.':
        false,
    'I have seen and agree with the pre-draw shape that my artist created. I understand that this is a guideline for the shape and size of my brow design and it may vary slightly once the procedure is done.':
        false,
    'There may be risks and hazard related to performing this procedure.':
        false,
    'There may be discomfort and pain during this procedure.': false,
    'There is a possibility of bleeding, swelling, redness and allergic reactions to pigments.':
        false,
    'Microblading is considered semi-permanent and can/will fade over time.':
        false,
    'Microblading, though semi-permanent, may last permanently and may not fade.':
        false,
    'Surgical procedures may be required to remove pigment from skin. These procedures may cause scarring and permanent damage to the skin.':
        false,
    'Final result cannot be determined until brows are completely healed at 4 to 6 weeks.':
        false,
    'I understand that permanent and semi-permanent makeup procedures cannot be guaranteed, and results cannot be predicted, as there are many variables that contribute to the final result, such as aftercare, skin type, lifestyle, etc.':
        false,
    'I have received post care instructions and will follow them to ensure results of my procedure are satisfactory.':
        false,
    'I am NOT pregnant': false,
    'I am NOT under the influence of drugs and/or alcohol or any other mind-altering substance':
        false,
    'I fully understand the procedure and give permission to my technician to perform the service of Microblading and all procedure and steps involved.':
        false,
    'I have truthfully filled out the consent form and have informed my technician of all medications I have taken.':
        false,
    'I release Bombay Salon & Spa LLC and its representatives and license technicians of all claims and injury, seen or unseen that may occur as a result of this procedure.':
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
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "I understand the following completely: (initial each statement)",
              style: TextStyle(
                fontSize: 18.0,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10.0),
            Container(
              width: 140.0,
              child: Theme(
                data: fieldTheme,
                child: TextFormField(
                  controller: _emailController,
                  validator:   (val){
                    validateZip(val!);
                  },
                  onSaved: ( val) {
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
            Text(
              "(hereinafter known as the “Piercer”) and all my questions have been answered to my full and total satisfaction. I acknowledge I have been advised of the matters set forth below and I agree as follows:",
              style: TextStyle(
                fontSize: 18.0,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ],
    );
  }

  _buildBottomAgreement() {
    return ListView(
      shrinkWrap: true,
      primary: false,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(10.0),
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Therefore, I request the Piercer to pierce my ",
              style: TextStyle(
                fontSize: 18.0,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10.0),
            Container(
              width: 140.0,
              child: Theme(
                data: fieldTheme,
                child: TextFormField(
                  controller: _emailController,
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
                    contentPadding: EdgeInsets.fromLTRB(20.0, 11.0, 20.0, 11.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'I understand this type of piercing usually takes ',
              style: TextStyle(
                fontSize: 18.0,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              width: 10.0,
            ),
            Container(
              width: 140.0,
              child: Theme(
                data: fieldTheme,
                child: TextFormField(
                  controller: _emailController,
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
                    contentPadding: EdgeInsets.fromLTRB(20.0, 11.0, 20.0, 11.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                ),
              ),
            ),
            Text(
              "or longer to heal. I agree to release and forever discharge and hold harmless the Piercer and all employees from any and all claims, damages or legal actions arising from or connected in any way with my piercing, or the procedure and conduct used in my piercing.",
              style: TextStyle(
                fontSize: 18.0,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ],
    );
  }
}
