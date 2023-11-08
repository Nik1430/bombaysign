import 'package:bombaysign/termspage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MicroFeePolicy extends StatefulWidget {
  @override
  _MicroFeePolicyState createState() => _MicroFeePolicyState();
}

class _MicroFeePolicyState extends State<MicroFeePolicy> {
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
                'MICROBLADING FEES & POLICIES & AFTER CARE INSTRUCTIONS',
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
                        ListView(
                          shrinkWrap: true,
                          primary: false,
                          children: values.keys.map((String key) {
                            return CheckboxListTile(
                              title: Text(key),
                              value: values[key],
                              activeColor: redColor,
                              checkColor: Colors.white,
                              onChanged: ( value) {
                                setState(() {
                                  values[key] = value!;
                                });
                              },
                            );
                          }).toList(),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "AFTER CARE INSTRUCTIONS",
                            style: TextStyle(
                              fontSize: 18.0,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Please follow these instructions for 10-14 days after the procedure to improve and prolong the results of your microblading. If you don’t follow these instructions, it can greatly affect your microblading results or put you at risk for infection!",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Items you need for immediately after the procedure:",
                            style: TextStyle(
                              fontSize: 18.0,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        ListView(
                          shrinkWrap: true,
                          primary: false,
                          children: values1.keys.map((String key) {
                            return CheckboxListTile(
                              title: Text(key),
                              value: values1[key],
                              activeColor: redColor,
                              checkColor: Colors.white,
                              onChanged: (  value) {
                                setState(() {
                                  values1[key] = value!;
                                });
                              },
                            );
                          }).toList(),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Avoid getting anything on the brows, including water, except for cleansing as directed.",
                            style: TextStyle(
                              fontSize: 18.0,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "For the first day after your procedure, please gently blot your brows every hour, using sterile gauze and a little bit of bottled/distilled water, to remove any excess lymph fluids. You can set an alarm on your phone to help remind you. This is very important to minimize scabbing and allow for better pigment retention!",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Cleansing: In 2-3 hours, wash lightly with slightly damp Q-tips and antibacterial soap. Repeat this very gently during days 1-4. When washing, it should be very gentle and with hardly any water and with a tapping motion, no rubbing. Do not attempt to remove the barrier film if it was applied. Allow it to come off naturally it is own time. Please avoid saturating brows with water. After the initial 3 days of washing, you may very sparingly apply balm (which I will provide), using a clean Q-tip, to hydrate your brow area for dryness relief. Do not pick or rub the brows. The flakes must fall off on their own or you will risk removing the color and possibly scarring.",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        ListView(
                          shrinkWrap: true,
                          primary: false,
                          children: values2.keys.map((String key) {
                            return CheckboxListTile(
                              title: Text(key),
                              value: values2[key],
                              activeColor: redColor,
                              checkColor: Colors.white,
                              onChanged: ( value) {
                                setState(() {
                                  values2[key] = value!;
                                });
                              },
                            );
                          }).toList(),
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
    'A 30-minute consultation is required prior to having the Microblading service. The cost is \$25, which will be applied to the final total':
        false,
    'The cost of the Microblading procedure is \$______– includes the initial session and touch up 6-8 weeks later':
        false,
    'Scheduled appointments for the touch up procedure require 48 hours notice for cancellation or rescheduling. The touch up service is included in the original price only when performed within 8 weeks after the initial session. Outside 8 weeks, or if appointments are missed, an additional charge will be incurred.':
        false,
    'A \$100 deposit is required to schedule your Microblading, which is applied to your final total. This is nonrefundable as we are setting aside a 3-hour time slot especially for you. If you need to reschedule your Microblading for any reason, you may keep your deposit on the appointment if we are given 2 weeks notice. If we do not have 2 weeks notice, we will unfortunately need to collect another \$100 deposit to schedule another session.':
        false,
  };
  Map<String, bool> values1 = {
    'Gold Dial antibacterial soap (in the pump) or Cetaphil': false,
    'Sterile gauze': false,
    'Distilled water': false,
  };
  Map<String, bool> values2 = {
    'Do not soak the treated area in the bath, pool or hot tub. For 30 days, refrain from swimming in salt water or chlorinated pools, saunas, hot yoga, steam rooms or sun beds.':
        false,
    'No exercise for 14 days. After 14 days – when exercising, wear a sweatband to avoid sweat on brow area.':
        false,
    'No makeup should be applied directly on the brows during the healing process.':
        false,
    'Do not touch, rub, pick or scratch your brows following treatment or during healing process':
        false,
    'You may find that your eyebrows will scab or become slightly dry following the treatment. If they itch, DO NO SCRATCH them. You may tap them to alleviate the itch.':
        false,
    'If your eyebrows get wet during the healing process, pat them dry with a towel, DO NOT RUB.':
        false,
    'Avoid using daily skincare products directly on the eyebrows.': false,
    'If you are planning a chemical peel, or any other medical procedure, please inform therapist of the procedure you have had. Procedure should only be done once the healing process is complete.':
        false,
    'If you are due to give blood after the procedure, please inform your nurse about the microblading treatment you have had as this might alter the results.':
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
                  validator:  (val){
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
