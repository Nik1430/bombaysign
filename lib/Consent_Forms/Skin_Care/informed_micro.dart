import 'package:bombaysign/termspage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InformedMicro extends StatefulWidget {
  @override
  _InformedMicroState createState() => _InformedMicroState();
}

class _InformedMicroState extends State<InformedMicro> {
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
                'INFORMED CONSENT FOR MICROBLADING',
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
                        _buildAgreement(),
                        SizedBox(height: 30.0),
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
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "I have been informed of the nature, risks, and possible complications and consequences of permanent skin pigmentation. I understand the permanent skin pigmentation procedure carries with it known and unknown complications and consequences associated with this type of cosmetic procedure, including but not limited to: infection, scarring, inconsistent color, and spreading, fanning or fading of pigments. I understand the actual color of the pigment may be modified slightly, due to the tone and color of my skin. I fully understand this is a tattoo process and therefore not an exact science but an art. I request the semi permanent skin pigmentation procedure(s) and accept the permanence of this procedure as well as the possible complications and consequences of the said procedure. \n\nThere is a possibility of an allergic reaction to numbing agent and/or pigments. A patch test is offered however it does not ensure a client will not have an allergic reaction. If waived, I release the technician from liability if I develop an allergic reaction to the pigment. Patch test must be booked at least 1 week prior to the procedure!",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "INITIAL ONE OR THE OTHER, NOT BOTH:",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: [
                            Text(
                              "I consent",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            SizedBox(width: 10.0),
                            Container(
                              width: 150.0,
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
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 11.0, 20.0, 11.0),
                                    hintText: "Initial",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide:
                                            BorderSide(color: Colors.black)),
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
                                "to the patch test",
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: [
                            Text(
                              "I waive",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            SizedBox(width: 10.0),
                            Container(
                              width: 150.0,
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
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 11.0, 20.0, 11.0),
                                    hintText: "Initial",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide:
                                            BorderSide(color: Colors.black)),
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
                                "to the patch test",
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "I understand that if I have any skin treatments, injectables, laser hair removal, plastic surgery or other skin altering procedures, it may result in adverse changes to my microblading procedure. I acknowledge some of these potential adverse changes may not be correctable.",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10.0),
                        Theme(
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
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 11.0, 20.0, 11.0),
                              hintText: "Initial",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.black)),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "I certify that I have read and initialed the above paragraphs and have had explained to my understanding the consent and procedure permit. I accept full responsibility for the decision to have this cosmetic semi-permanent pigmentation work done.",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: [
                            Text(
                              "I ",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            SizedBox(width: 10.0),
                            Container(
                              width: 150.0,
                              child: Theme(
                                data: fieldTheme,
                                child: TextFormField(
                                  controller: _emailController,
                                  validator:  (val){
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
                                    hintText: "Initial",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide:
                                            BorderSide(color: Colors.black)),
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
                                ",BOMBAY SALON & SPA permission to perform my microblading procedure",
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
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
                                          hintText: "Client Name",
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
                                          hintText: "Technician’s Name",
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
                                  SizedBox(height: 10.0),
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
                        SizedBox(
                          height: 20.0,
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
    'If an unforeseen condition arises in the course of the procedure, I authorize my therapist to use his/her professional judgment to decide what he/she feels is necessary under the given circumstances. I accept the responsibility for determining the color, shape and position of the microblading procedure as agreed during consultation. I fully understand and accept that non-toxic pigments are used during the procedure and that the result achieved may fade over a period of 1-3 years. Even once the color fades, pigment itself may stay in the skin indefinitely.':
        false,
    'I have been informed that the highest standards of hygiene are met and that sterile, disposable needles and pigment containers are used for each individual client, procedure and visit.':
        false,
    'Current use of eye drops of any kind, prescription or over-the-counter':
        false,
    'I understand and accept that each procedure is a process requiring multiple applications of pigment to achieve desired results and that 100% success cannot be guaranteed during the first procedure. I understand that I may have to return for a repeated procedure. » The result of the procedure can be affected by the following: medication, skin characteristics (dry, oily, sun-damaged thick or thin skin type), personal pH balance of your skin, alcohol intake and smoking, post procedure after care.':
        false,
    'I understand that with oily skin types, strokes can heal less crisp, expanded and/or blurry and may result in a powder-brow effect. » Upon completion of the procedure there might be swelling and redness of the skin, which will subside within 1-4 days. In some cases, bruising may occur. You may resume normal activities following the procedure, however, using cosmetics, excessive perspiration and exposure to the sun should be limited until the skin has fully healed. Please see after care instructions for more details. The procedure results will look acceptable for you to appear in public without additional make-up on the brows.':
        false,
    'I have been advised that the true color will be seen 6 weeks after each procedure, and that the pigment may vary according to skin tones, skin type, age and skin condition. I understand that some skin types accept pigment more readily and no guarantee on exact color can be given.':
        false,
    'To my knowledge, I do not have any physical, mental or medical impairment or disability that might affect my wellbeing as a direct or indirect result of my decision to have the procedure done at this time.':
        false,
    'I agree to follow all pre-procedure and post-procedure instructions as provided and explained to me by the technician. Failure to do so may jeopardize my chances for a successful procedure. I can confirm that I have received a copy of aftercare details.':
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
    " agree to have eyelash extensions applied to my \nnatural eyelashes and/or removed and retouched. \nBy signing this agreement, I consent to the placement \nand/or removal of the eyelash extensions by \nthe certified eyelash extension professional.",
    " understand that in rare occasions there are risks \nassociated with having artificial eyelashes \nand eyelash extensions applied to or removed from my \nnatural eyelashes. I further understand that in \nrare cases as part of the procedure eye irritation and discomfort could occur. \nI agree that if I experience any of these conditions \nwith my lashes that I will contact \nthe certified eyelash extension professional that performed \nthis procedure and it may be beneficial to have the eyelashes removed.",
    " understand and agree to the after-care instructions \nprovided by the certified eyelash extension \nprofessional for the use and care of my eyelash extensions.\nI realize and accept the consequences of \nfailure to adhere to these instructions may cause the eyelash \nextensions to fall out and/or decrease the time the lashes will last.",
    " understand and consent to having my eyes closed and \ncovered for the duration of approximately 60-120 minute procedure. \nTimes may vary depending on the type and number \nof eyelashes applied.",
    " I am informing the certified eyelash extension professional of the following conditions by marking with a check:"
  ];

  _buildAgreement() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "I",
          style: TextStyle(fontSize: 24.0),
        ),
        SizedBox(width: 10.0),
        Container(
          width: 150.0,
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
            "am over the age of 18, am not under the influence of drugs or alcohol, am not pregnant or nursing and desire to receive the indicated semi-permanent pigmentation procedure. The general nature of cosmetic micro-pigmentation, as well as the specific procedure to be performed, has been explained to me.",
            style: TextStyle(
              fontSize: 18.0,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }
}
